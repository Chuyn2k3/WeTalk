part of 'search_user_cubit.dart';


abstract class SearchUserState extends Equatable {
  const SearchUserState();
  @override
  List<Object> get props => [];
}

class SearchUserInitialState extends SearchUserState {
  @override
  List<Object> get props => [];
}

class SearchUserLoadingState extends SearchUserState {
  @override
  List<Object> get props => [];
}

class SearchUserLoadedState extends SearchUserState {
  final SearchUserModel searchUser;
  const SearchUserLoadedState({required this.searchUser});
  @override
  List<Object> get props => [searchUser];
}

class SearchUserErrorState extends SearchUserState {
  final String error;
  const SearchUserErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
