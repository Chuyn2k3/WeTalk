part of 'ai_detection_cubit.dart';

abstract class AiDetectionState extends Equatable {
  const AiDetectionState();
  @override
  List<Object> get props => [];
}

class AiDetectionInitState extends AiDetectionState {
  @override
  List<Object> get props => [];
}

class AiDetectionLoadingState extends AiDetectionState {
  @override
  List<Object> get props => [];
}

class AiDetectionLoadedState extends AiDetectionState {
  final AiDetectionModel detection;
  const AiDetectionLoadedState({required this.detection});
  @override
  List<Object> get props => [detection];
}

class AiDetectionErrorState extends AiDetectionState {
  final String error;
  const AiDetectionErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
