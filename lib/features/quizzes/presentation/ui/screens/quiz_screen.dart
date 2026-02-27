import 'dart:async';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/time.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/core/presentation/widgets/custom_button.dart';
import 'package:doublem/core/presentation/widgets/custom_loading.dart';
import 'package:doublem/core/utils/mixins/pagination_mixin/timer_mixin.dart';
import 'package:doublem/core/utils/presentation_utils/alert_dialog.dart';
import 'package:doublem/core/utils/presentation_utils/loader_widget_mixin.dart';
import 'package:doublem/core/utils/presentation_utils/loading_mixin.dart';
import 'package:doublem/features/quizzes/domain/entities/quiz_entity.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_bloc.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_event.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_state.dart';
import 'package:doublem/features/quizzes/presentation/controllers/solving_quiz_cubit/solving_quiz_cubit.dart';
import 'package:doublem/features/quizzes/presentation/ui/widgets/quiz_question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends StatefulWidget {
  final QuizEntity quizEntity;
  static const String path = '/quiz_screen';

  const QuizScreen({super.key, required this.quizEntity});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with ScreenLoadingUtils, ScreenLoader, WidgetsBindingObserver, TimerMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void submit({required BuildContext context}) {
    context.read<QuizzesBloc>().add(
      SubmitQuizEvent(
        quizId: widget.quizEntity.id,
        courseId: widget.quizEntity.id,
        data: context.read<SolvingQuizCubit>().selectedAnswers,
      ),
    );
  }

  Timer? _pausedTimer;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      dynamic state = context.read<QuizzesBloc>().state;
      if (state is StartingQuizError) {
      } else {
        _pausedTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
          submit(context: context);
          _pausedTimer?.cancel();
        });
      }
    }
    if (state == AppLifecycleState.resumed) {
      _pausedTimer?.cancel();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    timer?.cancel();
    _pausedTimer?.cancel();
    super.dispose();
  }

  @override
  Widget screen(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, t) {
        if (didPop) {
          return;
        } else {
          dynamic state = context.read<QuizzesBloc>().state;
          if (state is StartingQuizError ||
              state is QuizSubmittionError ||
              state is QuizLoadingError) {
            context.pop();
          } else {
            showAlertDialog(
              context,
              message: context.translations.quitQuizAlertMessage,
              onYesFunction: () {
                context.pop();
                context.pop();
                submit(context: context);
              },
            );
          }
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(title: widget.quizEntity.title),
        body: Center(
          child: BlocConsumer<QuizzesBloc, QuizzesState>(
            listener: (context, state) {
              if (state is QuizStarted) {
                context.read<QuizzesBloc>().add(
                  LoadQuizEvent(
                    quizId: widget.quizEntity.id,
                    courseId: widget.quizEntity.courseId,
                  ),
                );
              } else if (state is SubmittingQuiz) {
                startLoading();
              } else if (state is QuizSubmittionError) {
                stopLoading();
              } else if (state is QuizSubmitted) {
                stopLoading();
                context.pop();
              } else if (state is QuizLoaded) {
                context.read<SolvingQuizCubit>().initializeSelectedAnswers(
                  questions: state.quiz.questions,
                );
                print('object:${state.quiz.timeLimitMinutes}');
                secondsLeft =
                    (state.quiz.timeLimitMinutes == 0
                            ? 1
                            : state.quiz.timeLimitMinutes)
                        .inSeconds();
                startTimer(context: context);
              }
            },
            builder: (context, state) {
              if (state is StartingQuiz ||
                  state is QuizLoading ||
                  state is SubmittingQuiz) {
                return CustomLoadingWidget();
              } else if (state is StartingQuizError) {
                return Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(state.message),
                );
              } else if (state is QuizLoadingError) {
                return Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(state.message),
                );
              }

              return (state is QuizLoaded && state.quiz.questions != null)
                  ? Column(
                      children: [
                        Center(child: Text(formattedTime)),
                        Expanded(
                          child: ListView.separated(
                            itemCount: state.quiz.questions!.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 34.h),
                            itemBuilder: (context, index) {
                              return QuizQuestionCard(
                                questionEntity: state.quiz.questions![index],
                                index: index,
                              );
                            },

                            padding: EdgeInsets.symmetric(
                              horizontal: 25.w,
                              vertical: 25.h,
                            ),
                          ),
                        ),
                        CustomButton(
                          title: context.translations.submit,
                          onPressed: () {
                            submit(context: context);
                          },
                        ),
                        SizedBox(height: 20.h),
                      ],
                    )
                  : (state is QuizLoading)
                  ? CustomLoadingWidget()
                  : (state is QuizSubmittionError)
                  ? Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text(state.message),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text(context.translations.failedToLoadData),
                    );
            },
          ),
        ),
      ),
    );
  }
}
