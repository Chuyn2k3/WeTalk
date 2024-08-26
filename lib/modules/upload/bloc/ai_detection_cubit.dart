import 'package:equatable/equatable.dart';
import 'package:flutter_app/modules/upload/model/ai_detection_model.dart';
import 'package:flutter_app/modules/upload/repo/upload_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'ai_detection_state.dart';

GetIt _sl = GetIt.instance;

class AiDetectionCubit extends Cubit<AiDetectionState> {
  AiDetectionCubit() : super(AiDetectionInitState());
  final UploadRepository _uploadRepository = _sl();

  void aiDetection(String linkMedia) async {
    try {
      emit(AiDetectionLoadingState());
      final result = await _uploadRepository.aiDetection(linkMedia);
      emit(AiDetectionLoadedState(detection: result));
    } catch (e) {
      emit(AiDetectionErrorState(error: e.toString()));
    }
  }
}
