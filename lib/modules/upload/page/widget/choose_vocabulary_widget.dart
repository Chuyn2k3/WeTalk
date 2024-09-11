import 'package:design_system_sl/typography/typography.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/study/bloc/list_topic_cubit.dart';
import 'package:flutter_app/modules/study/bloc/list_vocabulary_by_topic_cubit.dart';
import 'package:flutter_app/modules/study/model/topic_model.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/modules/upload/page/widget/video_display.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildChooseDeviceType extends StatefulWidget {
  const BuildChooseDeviceType({super.key, required this.getVocabulary});
  final Function(int) getVocabulary;
  @override
  State<BuildChooseDeviceType> createState() => _BuildChooseDeviceTypeState();
}

class _BuildChooseDeviceTypeState extends State<BuildChooseDeviceType> {
  List<String> suggestList = [];
  List<DataTopic> listTopic = [];
  List<Data> listVocabulary = [];
  int? topicId;
  String? linkVideo;
  String? linkImage;
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ListTopicCubit()..getListTopic(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<ListTopicCubit, ListTopicState>(
            listener: (context, state) {
              if (state is ListTopicLoadedState) {
                setState(() {
                  listTopic = state.lsttopic.data ?? [];
                });
              }
            },
          ),
          BlocListener<ListVocabularyByTopicCubit, ListVocabularyByTopicState>(
            listener: (context, state) {
              if (state is ListVocabularyByTopicLoadedState) {
                if (topicId != null && topicId! >= 0) {
                  setState(() {
                    listVocabulary = state.lstvocabulary.data ?? [];
                  });
                }
              }
            },
          )
        ],
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: DropdownSearch<DataTopic>(
                items: listTopic,
                popupProps: PopupProps.menu(
                    title: const Text("Chọn chủ đề"),
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal:
                                  10), // Điều chỉnh padding để thay đổi chiều cao
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style:
                            SLStyle.t14M.copyWith(color: AppColors.greyColor)),
                    itemBuilder: (context, item, _) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item.content ?? "-",
                            style: SLStyle.t14M
                                .copyWith(color: AppColors.greyColor)),
                      );
                    }),
                clearButtonProps: const ClearButtonProps(isVisible: false),
                dropdownBuilder: (context, item) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item != null
                          ? (item.content ?? "Chọn chủ đề")
                          : "Chọn chủ đề",
                      style: SLStyle.t14M.copyWith(color: AppColors.greyColor),
                    ),
                  );
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    border: InputBorder.none,
                  ),
                ),
                onChanged: (value) async {
                  if (value != null) {
                    setState(() {
                      topicId = value.topicId ?? -1;
                    });
                    context
                        .read<ListVocabularyByTopicCubit>()
                        .getListVocabularyByTopic(topicId ?? -1);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: DropdownSearch<Data>(
                items: listVocabulary,
                popupProps: PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal:
                                  10), // Điều chỉnh padding để thay đổi chiều cao
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style:
                            SLStyle.t14M.copyWith(color: AppColors.greyColor)),
                    itemBuilder: (context, item, _) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item.content ?? "-",
                            style: SLStyle.t14M
                                .copyWith(color: AppColors.greyColor)),
                      );
                    }),
                clearButtonProps: const ClearButtonProps(isVisible: false),
                dropdownBuilder: (context, item) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item != null
                          ? (item.content ?? "Chọn từ vựng")
                          : "Chọn từ vựng",
                      style: SLStyle.t14M.copyWith(color: AppColors.greyColor),
                    ),
                  );
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    border: InputBorder.none,
                  ),
                ),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      if (value.vocabularyImageResList != null &&
                          value.vocabularyImageResList!.isNotEmpty) {
                        linkImage =
                            value.vocabularyImageResList?[0].imageLocation ??
                                "";
                      }
                      if (value.vocabularyVideoResList != null &&
                          value.vocabularyVideoResList!.isNotEmpty) {
                        linkVideo =
                            value.vocabularyVideoResList?[0].videoLocation ??
                                "";
                      }
                      linkVideo =
                          value.vocabularyVideoResList?[0].videoLocation ?? "";
                    });
                    widget.getVocabulary(value.vocabularyId ?? -1);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      if (linkVideo != null && linkVideo!.isNotEmpty) {
                        showDialogPlayVideo(
                          context: context,
                          medialUrl: linkVideo ?? "",
                        );
                      } else {
                        context.showSnackBarFail(text: "Không có video mẫu");
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Xem video mẫu",
                          style: textTheme.t14B
                              .copyWith(color: AppColors.lightBlueColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      if (linkImage != null && linkImage!.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Image.network(linkImage ?? ""),
                            );
                          },
                        );
                      } else {
                        context.showSnackBarFail(text: "Không có ảnh mẫu");
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Xem ảnh mẫu",
                          style: textTheme.t14B
                              .copyWith(color: AppColors.lightBlueColor),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
