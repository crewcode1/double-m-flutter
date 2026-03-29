import 'package:doublem/core/enums/types/question_type_enum.dart';
import 'package:doublem/features/quizzes/domain/entities/question_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'solving_quiz_state.dart';

class SolvingQuizCubit extends Cubit<SolvingQuizState> {
  SolvingQuizCubit() : super(const SolvingQuizState(selectedAnswers: {}));

  void initializeSelectedAnswers({required List<QuestionEntity>? questions}) {
    final Map<String, List<int>> initial = {};
    if (questions != null) {
      for (var q in questions) {
        initial['${q.id}'] = [];
      }
    }
    emit(SolvingQuizState(selectedAnswers: initial));
  }

  bool isSelected({required int questionId, required int answer}) {
    final list = state.selectedAnswers['$questionId'] ?? [];
    return list.contains(answer);
  }

  void selectAnswer({
    required QuestionTypeEnum questionType,
    required int questionId,
    required int answer,
  }) {
    final newMap = Map<String, List<int>>.from(state.selectedAnswers);
    final list = List<int>.from(newMap['$questionId'] ?? []);

    switch (questionType) {
      case QuestionTypeEnum.multipleChoice:
      case QuestionTypeEnum.trueOrFalse:
        if (list.contains(answer)) {
          list.clear();
        } else {
          list
            ..clear()
            ..add(answer);
        }
        break;

      case QuestionTypeEnum.multipleSelect:
        if (list.contains(answer)) {
          list.remove(answer);
        } else {
          list.add(answer);
        }
        break;
    }

    newMap['$questionId'] = list;

    // 👈 emit بعد التعديل
    emit(SolvingQuizState(selectedAnswers: newMap));
  }
}
