import 'package:equatable/equatable.dart';
import 'package:flutter_app/modules/upload/model/data_collect_model.dart';
import 'package:flutter_app/modules/upload/repo/upload_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'create_upload_state.dart';

GetIt _sl = GetIt.instance;

class CreateUploadCubit extends Cubit<CreateUploadState> {
  CreateUploadCubit() : super(CreateUploadInititalState());
  final UploadRepository _uploadRepository = _sl();
  void createUpload(
      String linkMedia, dynamic detection, int vocabularyId) async {
    try {
      emit(CreateUploadLoadingState());
      Map<String, dynamic> data = {
        "dataLocation": linkMedia,
        "detectionContent": detection,
        "vocabularyId": vocabularyId
      };
      final result = await _uploadRepository.createUpload(data);
      emit(CreateUploadLoadedState(data: result));
    } catch (e) {
      emit(CreateUploadErrorState(error: e.toString()));
    }
  }
}
