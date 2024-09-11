import 'dart:io';

import 'package:design_system_sl/theme/components/button/enums.dart';
import 'package:design_system_sl/theme/components/button/sl_button.dart';
import 'package:design_system_sl/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/modules/upload/bloc/ai_detection_cubit.dart';
import 'package:flutter_app/modules/upload/bloc/create_upload_cubit.dart';
import 'package:flutter_app/modules/upload/bloc/get_url_cubit.dart';
import 'package:flutter_app/modules/upload/model/file_upload_model.dart';
import 'package:flutter_app/modules/upload/page/widget/choose_vocabulary_widget.dart';
import 'package:flutter_app/modules/upload/widget/bottom_sheet_action.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/convert_upload_file.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class UpLoadScreen extends StatefulWidget {
  const UpLoadScreen({super.key});

  @override
  State<UpLoadScreen> createState() => _UpLoadScreenState();
}

class _UpLoadScreenState extends State<UpLoadScreen> {
  UploadFile? _file;
  int vocabularyId = -1;
  String dataLocation = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: _buildAppBar(),
      body: GestureDetector(
        onTap: () {
          if (Platform.isIOS) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          } else {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Padding(
          //margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              BuildChooseDeviceType(
                getVocabulary: getVocabulary,
              ),
              _buildImportImageVideo(),
              Expanded(child: _buildFilesChoosen()),
              const Expanded(
                child: SizedBox(),
              ),
              _builBottomButton()
            ],
          ),
        ),
      ),
    );
  }

  CustomAppbar _buildAppBar() {
    return CustomAppbar.basic(
      onTap: () => Navigator.pop(context),
      isLeading: true,
      title: "Đăng tải nội dung",
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(Assets.icon.info),
          ),
        ),
      ],
    );
  }

  Widget _buildImportImageVideo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          "Tải lên file",
          style: SLStyle.t16R,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: BottomSheetAction(
                  icon: Assets.icon.takeVideo,
                  label: "Quay video",
                  onClick: () async {
                    final imagePicker = ImagePicker();
                    final resultVideo = await imagePicker.pickVideo(
                      source: ImageSource.camera,
                    );
                    _handleResultImagePicker(resultVideo);
                  }),
            ),
            Expanded(
              flex: 1,
              child: BottomSheetAction(
                  icon: Assets.icon.takePicture,
                  label: "Chụp ảnh",
                  onClick: () async {
                    final imagePicker = ImagePicker();
                    final resultImage =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    _handleResultImagePicker(resultImage);
                  }),
            ),
            Expanded(
              flex: 1,
              child: BottomSheetAction(
                  icon: Assets.icon.importFromFiles,
                  label: "Tải file từ thưa viện",
                  onClick: () async {
                    final imagePicker = ImagePicker();
                    final choosenFiles = await imagePicker.pickMedia();
                    _handleResultImagePicker(choosenFiles);
                  }),
            ),
          ],
        )
      ],
    );
  }

  void _handleResultImagePicker(XFile? choosenFiles) async {
    final file = await File(choosenFiles!.path).toUploadFile();
    setState(() {
      _file = file;
    });
  }

  void getVocabulary(int idVocabulary) {
    setState(() {
      vocabularyId = idVocabulary;
    });
  }

  Widget _buildFilesChoosen() {
    if (_file == null) {
      return Center(
        child: Text(
          'Không có file ',
          style: SLStyle.t14R,
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: _buildFileItem(
          file: _file!,
          onClick: () async {},
          onDelete: () {
            setState(() {
              _file = null;
            });
          },
        ),
      );
    }
  }

  Widget _buildFileItem({
    required UploadFile file,
    required VoidCallback onClick,
    required VoidCallback onDelete,
  }) {
    return GestureDetector(
      onTap: onClick,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: file.thumnaill,
          ),
          Expanded(
            child: Text(
              file.fileName,
              style: SLStyle.t14R,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 4),
            child: Text(
              _file!.fileSize,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0x993C3C43),
              ),
            ),
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: onDelete,
            icon: SvgPicture.asset(Assets.icon.icClaimDelete),
          )
        ],
      ),
    );
  }

  Widget _builBottomButton() {
    return MultiBlocListener(
        listeners: [
          BlocListener<GetUrlCubit, GetUrlState>(
            listener: (context, state) {
              if (state is GetUrlLoadedState) {
                setState(() {
                  dataLocation = state.link.replaceFirst("wetalk", "wesign");
                });
                context
                    .read<AiDetectionCubit>()
                    .aiDetection(state.link.replaceFirst("wetalk", "wesign"));
              }
              if (state is GetUrlErrorState) {
                context.showSnackBarFail(text: "Lỗi đường dẫn");
              }
            },
          ),
          BlocListener<AiDetectionCubit, AiDetectionState>(
            listener: (context, state) {
              if (state is AiDetectionLoadedState) {
                if (state.detection.status == "200") {
                  context.showSnackBarSuccess(text: "AI nhận diện thành công");
                } else if (state.detection.status != "200") {
                  context.showSnackBarFail(
                      text: "AI nhận diện không thành công");
                }
                if (vocabularyId >= 0 && dataLocation.isNotEmpty) {
                  context.read<CreateUploadCubit>().createUpload(dataLocation,
                      state.detection.data?.content, vocabularyId);
                } else {
                  context.showSnackBarFail(text: "Lỗi upload");
                }
              } else if (state is GetUrlErrorState) {
                context.showSnackBarFail(text: "Lỗi đường dẫn");
              }
            },
          )
        ],
        child: BlocListener<CreateUploadCubit, CreateUploadState>(
          listener: (context, state) {
            if (state is CreateUploadLoadedState) {
              context.showSnackBarSuccess(
                  text: " thành công", positionTop: true);
              setState(() {
                isLoading = false;
                vocabularyId = -1;
                dataLocation = "";
                _file = null;
              });
            }
            if (state is CreateUploadErrorState) {
              context.showSnackBarFail(text: "Lỗi ");
              setState(() {
                isLoading = false;
              });
            }
            if (state is CreateUploadLoadingState) {
              setState(() {
                isLoading = true;
              });
            }
          },
          child: Container(
            margin: const EdgeInsets.only(top: 12),
            child: SafeArea(
              top: false,
              child: SLButton.brand(
                onTap: () async {
                  if (_file != null) {
                    context.read<GetUrlCubit>().getUrl(_file!.file);
                  }
                },
                label: "Gửi file",
                size: SLSize.large,
                isLoading: isLoading,
                isRounded: true,
                isMaxWidth: true,
              ),
            ),
          ),
        ));
  }
}
