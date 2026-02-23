import 'package:doublem/core/enums/types/question_type_enum.dart';
import 'package:doublem/features/quizzes/domain/entities/question_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'solving_quiz_state.dart';

class SolvingQuizCubit extends Cubit<SolvingQuizState> {
  Map<String, List<int>> selectedAnswers = {};
  SolvingQuizCubit() : super(SolvingQuizInitial());
  void initializeSelectedAnswers({required List<QuestionEntity>? questions}) {
    if (questions != null) {
      for (var i = 0; i < questions.length; i++) {
        selectedAnswers['${questions[i].id}'] = [];
      }
    }
  }

  bool isSelected({required int questionId, required int answer}) {
    List<int> questionAnswerList = selectedAnswers['$questionId'] ?? [];
    if (questionAnswerList.isEmpty) {
      return false;
    } else {
      return questionAnswerList.contains(answer);
    }
  }

  void selectAnswer({
    required QuestionTypeEnum questionType,
    required int questionId,
    required int answer,
  }) {
    switch (questionType) {
      case QuestionTypeEnum.multipleChoice:
        multipleChoiceLogic(answer: answer, questionId: questionId);
      case QuestionTypeEnum.multipleSelect:
        multipleSelectLogic(answer: answer, questionId: questionId);
      case QuestionTypeEnum.trueOrFalse:
        multipleChoiceLogic(answer: answer, questionId: questionId);
    }
    // print(selectedAnswers);
  }

  void multipleChoiceLogic({required int questionId, required int answer}) {
    emit(SelectAnswerState(answer: answer));

    List<int> questionAnswerList = selectedAnswers['$questionId'] ?? [];
    if (questionAnswerList.isEmpty) {
      questionAnswerList.add(answer);
    } else {
      if (questionAnswerList.contains(answer)) {
        questionAnswerList.clear();
      } else {
        questionAnswerList[0] = answer;
      }
    }
  }

  void multipleSelectLogic({required int questionId, required int answer}) {
    emit(SelectAnswerState(answer: answer));

    List<int> questionAnswerList = selectedAnswers['$questionId'] ?? [];

    final int index = questionAnswerList.indexOf(answer);
    if (index != -1) {
      questionAnswerList.remove(answer);
    } else {
      questionAnswerList.add(answer);
    }
  }
}
