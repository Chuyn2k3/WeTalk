part of "create_upload_cubit.dart";

abstract class CreateUploadState extends Equatable {
  const CreateUploadState();
  @override
  List<Object> get props => [];
}

class CreateUploadInititalState extends CreateUploadState {
  @override
  List<Object> get props => [];
}

class CreateUploadLoadingState extends CreateUploadState {
  @override
  List<Object> get props => [];
}

class CreateUploadLoadedState extends CreateUploadState {
  final DataCollectModel data;
  const CreateUploadLoadedState({required this.data});
  @override
  List<Object> get props => [];
}

class CreateUploadErrorState extends CreateUploadState {
  final String error;
  const CreateUploadErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
