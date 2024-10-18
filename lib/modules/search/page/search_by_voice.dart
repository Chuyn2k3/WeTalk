import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/search/cubit/search_vocabulary_by_text_cubit.dart';
import 'package:flutter_app/modules/study/widget/study/vocabulary_widget.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_app/widget/circular_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchByVoice extends StatefulWidget {
  const SearchByVoice({super.key});

  @override
  State<SearchByVoice> createState() => _SearchByVoiceState();
}

class _SearchByVoiceState extends State<SearchByVoice> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String? _text;
  String title = "Nhấn vào mic để bắt đầu nói";
  BuildContext? _dialogContext;
  bool _available = false;
  late SearchVocabularyByTextCubit _searchVocabularyByTextCubit;
  @override
  void initState() {
    super.initState();
    _searchVocabularyByTextCubit = SearchVocabularyByTextCubit();
    _speech = stt.SpeechToText();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final status = await Permission.microphone.request();
    // Kiểm tra và yêu cầu quyền truy cập micro
    if (status.isGranted) {
      final available = await _speech.initialize();

      setState(() {
        _available = available;
      });
    } else {
      if (!mounted) return;
      context.showSnackBarFail(text: "Cần cấp quyền truy cập micro");
    }
  }

  void _listen() async {
    // Chỉ thu âm khi quyền đã được cấp
    _speech.statusListener = _statusListener;
    if (_available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) => setState(() {
          _text = val.recognizedWords;
        }),
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  void _statusListener(String status) {
  if (status == 'done' || status == 'notListening') {
    _stopListening();
    if (mounted && _dialogContext != null) {
      Navigator.pop(_dialogContext!, _text);
      _dialogContext = null;
    }
    callApi();
  }
}


  void callApi() {
    if (_text != null && _text!.isNotEmpty) {
      _searchVocabularyByTextCubit.searchVocabularyByText(_text ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchVocabularyByTextCubit,
      child: BaseScaffold(
        appBar: CustomAppbar.basic(
          isLeading: true,
          title: "Tìm kiếm bằng giọng nói",
          onTap: () => Navigator.pop(context),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () async {
                if (_available == true) {
                  _listen();
                }
                await showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (dialogContext) {
                    _dialogContext = dialogContext;
                    return WillPopScope(
                      onWillPop: () async{
                        _stopListening();
                        return false;
                      },
                      child: AlertDialog(
                        content: AvatarGlow(child: _buildMicForSpeech()),
                      ),
                    );
                  },
                );
              },
              child: !_isListening?const SizedBox(
                height: 80,
                width: 80,
                child: Icon(
                  size: 100,
                  Icons.mic,
                  color: Colors.black38,
                ),
              ):const SizedBox.shrink(),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Nội dung tìm kiếm: ",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    _text ?? "",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<SearchVocabularyByTextCubit,
                SearchVocabularyByTextState>(
              listener: (context, state) {
                if (state is SearchVocabularyByTextErrorState) {
                  context.showSnackBarFail(text: state.error);
                }
              },
              builder: (context, state) {
                if (state is SearchVocabularyByTextLoadingState) {
                  return const Center(
                    child: CircularIndicator(),
                  );
                }
                if (state is SearchVocabularyByTextLoadedState) {
                  final data = state.vocabularyModel.data;
                  if (data != null && data.isNotEmpty) {
                    return Expanded(
                      child: GridView.count(
                        padding: EdgeInsets.zero,
                        crossAxisCount: 2,
                        children: data
                            .map((e) => vocabularyWidget(
                                  e.content ?? "",
                                  e.vocabularyVideoResList!.isNotEmpty
                                      ? (e.vocabularyVideoResList?[0]
                                              .videoLocation ??
                                          "")
                                      : "",
                                  e.vocabularyImageResList!.isNotEmpty
                                      ? (e.vocabularyImageResList?[0]
                                              .imageLocation ??
                                          "")
                                      : "",
                                  e.vocabularyImageResList ?? [],
                                  e.vocabularyVideoResList ?? [],
                                ))
                            .toList(),
                      ),
                    );
                  }
                  return const Text("Không tìm thấy từ vựng");
                }
                if (state is SearchVocabularyByTextErrorState) {
                  return const Text("Có lỗi xảy ra");
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMicForSpeech() {
    const r1 = 40 / 2;
    const r2 = r1 / 1.08;
    const r3 = r2 / 1.08;

    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.2,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: 1.05,
              child: FilledCircle(
                radius: r1,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          FilledCircle(
            color: Theme.of(context).colorScheme.primary,
            radius: r1,
          ),
          FilledCircle(
            color: Theme.of(context).colorScheme.secondary,
            radius: r2,
          ),
          const FilledCircle(
            color: Colors.white,
            radius: r3,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              "assets/image/microphone.png",
              width: 100,
              height: 100,
            ),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
void dispose() {
  if (_isListening) {
    _speech.stop(); // Đảm bảo dừng việc lắng nghe trước khi huỷ
  }
  _searchVocabularyByTextCubit.close();
  super.dispose();
}

}

class FilledCircle extends StatelessWidget {
  final double radius;
  final Color color;

  const FilledCircle({
    Key? key,
    required this.radius,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipOval(
        child: Container(
          width: radius,
          height: radius,
          color: color,
        ),
      );
}
