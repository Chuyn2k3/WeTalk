import 'package:flutter/material.dart';
import 'package:flutter_app/modules/search/cubit/search_vocabulary_by_text_cubit.dart';
import 'package:flutter_app/modules/study/widget/study/vocabulary_widget.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/utils/input_text_field.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_app/widget/circular_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchVocabularyByText extends StatefulWidget {
  const SearchVocabularyByText({super.key});

  @override
  State<SearchVocabularyByText> createState() => _SearchVocabularyByTextState();
}

class _SearchVocabularyByTextState extends State<SearchVocabularyByText> {
  final TextEditingController _textEditingController = TextEditingController();
  late SearchVocabularyByTextCubit _searchVocabularyByTextCubit;
  @override
  void initState() {
    _searchVocabularyByTextCubit = SearchVocabularyByTextCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchVocabularyByTextCubit,
      child: BaseScaffold(
        appBar: CustomAppbar.basic(
          isLeading: true,
          onTap: Navigator.of(context).pop,
          actions: [
            const Expanded(
                child: SizedBox(
              width: 8,
            )),
            Expanded(
              flex: 4,
              child: LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  height: 38,
                  //width: 150,
                  child: InputTextField(
                    autoFocus: true,
                    onChanged: (value) {
                      _searchVocabularyByTextCubit
                          .searchVocabularyByText(_textEditingController.text);
                    },
                    textController: _textEditingController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Tìm kiếm từ vựng',
                        contentPadding: const EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 110, 107, 107)),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(162))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 233, 231, 231),
                                width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        disabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    maxLine: 1,
                    textAlign: TextAlign.left,
                    ontap: () {},
                  ),
                );
              }),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        body: BlocConsumer<SearchVocabularyByTextCubit,
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
                return GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  children: data
                      .map((e) => vocabularyWidget(
                            e.content ?? "",
                            e.vocabularyVideoResList!.isNotEmpty
                                ? (e.vocabularyVideoResList?[0].videoLocation ??
                                    "")
                                : "",
                            e.vocabularyImageResList!.isNotEmpty
                                ? (e.vocabularyImageResList?[0].imageLocation ??
                                    "")
                                : "",
                            e.vocabularyImageResList ?? [],
                            e.vocabularyVideoResList ?? [],
                          ))
                      .toList(),
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
      ),
    );
  }
}
