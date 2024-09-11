import 'dart:io';

import 'package:flutter_app/modules/upload/repo/upload_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'get_url_state.dart';

GetIt _sl = GetIt.instance;

class GetUrlCubit extends Cubit<GetUrlState> {
  GetUrlCubit() : super(GetUrlInitialState());
  final UploadRepository _uploadRepository = _sl();
  void getUrl(File file) async {
    try {
      emit(GetUrlLoadingState());
      final result = await _uploadRepository.getUrlLink(file);
      emit(GetUrlLoadedState(link: result));
    } catch (e) {
      emit(GetUrlErrorState(error: e.toString()));
    }
  }
}
