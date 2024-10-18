import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:video_player/video_player.dart';

class _DisplayVideoDialog extends StatefulWidget {
  const _DisplayVideoDialog({required this.medialUrl});

  final String medialUrl;

  @override
  State<_DisplayVideoDialog> createState() => _DisplayVideoDialogState();
}

class _DisplayVideoDialogState extends State<_DisplayVideoDialog> {
  late final VideoPlayerController _videoCtrl;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  @override
  void dispose() {
    super.dispose();
    _videoCtrl.dispose();
  }

  Future<void> _loadVideo() async {
    try {
      _videoCtrl = VideoPlayerController.network((widget.medialUrl))
        ..initialize().then((_) {
          _videoCtrl.play();
          setState(() {
            _isLoading = false;
          });
        });
    } catch (e) {
      context.showSnackBarFail(text: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: AppColors.startBtnColor,
                strokeWidth: 4,
              ),
            ),
          ),
        ],
      );
    } else {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        contentPadding: EdgeInsets.zero,
        content: Stack(
          children: [
            AspectRatio(
              aspectRatio: _videoCtrl.value.aspectRatio,
              child: VideoPlayer(_videoCtrl),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (_videoCtrl.value.isPlaying) {
                      _videoCtrl.pause();
                    } else {
                      _videoCtrl.play();
                    }
                  });
                },
                child: Icon(
                  _videoCtrl.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

void showDialogPlayVideo({
  required BuildContext context,
  required String medialUrl,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return _DisplayVideoDialog(medialUrl: medialUrl);
    },
  );
}
