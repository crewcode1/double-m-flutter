part of 'solving_quiz_cubit.dart';

class SolvingQuizState extends Equatable {
  final Map<String, List<int>> selectedAnswers;

  const SolvingQuizState({required this.selectedAnswers});

  @override
  List<Object> get props => [selectedAnswers];
}
