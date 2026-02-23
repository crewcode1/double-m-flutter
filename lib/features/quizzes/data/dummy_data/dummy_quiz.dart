import 'package:doublem/core/enums/types/question_type_enum.dart';
import 'package:doublem/features/quizzes/domain/entities/option_entity.dart';
import 'package:doublem/features/quizzes/domain/entities/question_entity.dart';

List<QuestionEntity> dummyQuiz = List.generate(
  9,
  (index) => QuestionEntity(
    id: index + 1,
    quizId: 1,
    text: 'Is Ranoshaaa The Best Queen Ever',
    questionType: index % 2 == 0
        ? QuestionTypeEnum.multipleChoice
        : QuestionTypeEnum.multipleSelect,
    points: 5,
    displayOrder: 1,
    options: [
      OptionEntity(
        id: 1,
        questionId: 1,
        text: 'Yes',
        isCorrect: true,
        displayOrder: 1,
      ),
      OptionEntity(
        id: 2,
        questionId: 1,
        text: 'No',
        isCorrect: false,
        displayOrder: 2,
      ),
      OptionEntity(
        id: 3,
        questionId: 1,
        text: 'Yes But SomeTimes No',
        isCorrect: false,
        displayOrder: 3,
      ),
      OptionEntity(
        id: 4,
        questionId: 1,
        text: 'No But SomeTimes Yes',
        isCorrect: false,
        displayOrder: 4,
      ),
    ],
  ),
);
