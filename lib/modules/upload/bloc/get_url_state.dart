part of 'get_url_cubit.dart';

abstract class GetUrlState extends Equatable {
  const GetUrlState();
  @override
  List<Object> get props => [];
}

class GetUrlInitialState extends GetUrlState {
  @override
  List<Object> get props => [];
}

class GetUrlLoadingState extends GetUrlState {
  @override
  List<Object> get props => [];
}

class GetUrlLoadedState extends GetUrlState {
  final String link;
  const GetUrlLoadedState({required this.link});
  @override
  List<Object> get props => [link];
}

class GetUrlErrorState extends GetUrlState {
  final String error;
  const GetUrlErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
