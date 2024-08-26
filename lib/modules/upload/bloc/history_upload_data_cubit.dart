import 'package:equatable/equatable.dart';
import 'package:flutter_app/modules/upload/model/history_upload_model.dart';
import 'package:flutter_app/modules/upload/repo/upload_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'history_upload_data_state.dart';

GetIt _sl = GetIt.instance;

class UploadHistoryCubit extends Cubit<UploadHistoryState> {
  UploadHistoryCubit() : super(UploadHistoryInititalState());
  final UploadRepository _uploadRepository = _sl();
  Future<void> getUploadHistory() async {
    emit(UploadHistoryLoadingState());

    await _callApi();
  }

  Future<void> refresh() async {
    await _callApi();
  }

  Future<void> _callApi() async {
    try {
      final result = await _uploadRepository.getHistoryUpload();
      emit(UploadHistoryLoadedState(uploads: result));
    } catch (e) {
      print(e);
      emit(UploadHistoryErrorState(error: e.toString()));
    }
  }
}
