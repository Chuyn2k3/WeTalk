import 'package:equatable/equatable.dart';
import 'package:flutter_app/modules/search/model/search_user_model.dart';
import 'package:flutter_app/modules/search/repository/search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'search_user_state.dart';

GetIt _sl = GetIt.instance;

class SearchUserCubit extends Cubit<SearchUserState> {
  SearchUserCubit() : super(SearchUserInitialState());

  final SearchRepository _searchRepository = _sl();
  void searchUser(String text) async {
    try {
      emit(SearchUserLoadingState());
      final result = await _searchRepository.searchUser(text);
      emit(SearchUserLoadedState(searchUser: result));
      print('call ok');
    } catch (e) {
      emit(SearchUserErrorState(error: e.toString()));
    }
  }
}
