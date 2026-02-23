part of 'solving_quiz_cubit.dart';

sealed class SolvingQuizState extends Equatable {
  const SolvingQuizState();

  @override
  List<Object> get props => [];
}

final class SolvingQuizInitial extends SolvingQuizState {}

final class SelectAnswerState extends SolvingQuizState {
  final int answer;
  const SelectAnswerState({required this.answer});
  @override
  List<Object> get props => [answer];
}
