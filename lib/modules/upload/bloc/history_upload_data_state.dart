part of "history_upload_data_cubit.dart";


abstract class UploadHistoryState extends Equatable {
  const UploadHistoryState();
  @override
  List<Object> get props => [];
}

class UploadHistoryInititalState extends UploadHistoryState {
  @override
  List<Object> get props => [];
}

class UploadHistoryLoadingState extends UploadHistoryState {
  @override
  List<Object> get props => [];
}

class UploadHistoryLoadedState extends UploadHistoryState {
  final HistoryUploadModel uploads;
  const UploadHistoryLoadedState({required this.uploads});
  @override
  List<Object> get props => [uploads];
}

class UploadHistoryErrorState extends UploadHistoryState {
  final String error;
  const UploadHistoryErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
