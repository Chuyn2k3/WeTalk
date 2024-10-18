abstract class QuestionEvent {}

class FetchQuestion extends QuestionEvent {
  final String idTopic;
  FetchQuestion({required this.idTopic});
}
