import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/forgot_password_screen.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/login_screen.dart';
import 'package:doublem/features/course/domain/entities/enrolled_course.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_bloc.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_event.dart';
import 'package:doublem/features/course/presentation/ui/screens/course_screen.dart';
import 'package:doublem/features/home/presentation/ui/screens/home_screen.dart';
import 'package:doublem/features/main/presentation/ui/screens/main_screen.dart';
import 'package:doublem/features/notifications/presentation/ui/screens/notifications_screen.dart';
import 'package:doublem/features/profile/presentation/ui/screens/profile_screen.dart';
import 'package:doublem/features/quizzes/domain/entities/quiz_entity.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_bloc.dart';
import 'package:doublem/features/quizzes/presentation/controllers/sections_and_lessons_bloc/quizzes_event.dart';
import 'package:doublem/features/quizzes/presentation/ui/screens/quiz_screen.dart';
import 'package:doublem/features/quizzes/presentation/ui/screens/quizzes_screen.dart';
import 'package:doublem/features/sections&lessons/domain/entities/lesson_entity.dart';
import 'package:doublem/features/sections&lessons/domain/entities/section_entity.dart';
import 'package:doublem/features/sections&lessons/presentation/controllers/sections_and_lessons_bloc/sections_and_lessons_bloc.dart';
import 'package:doublem/features/sections&lessons/presentation/controllers/sections_and_lessons_bloc/sections_and_lessons_event.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/screens/lessons_screen.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/screens/lesson_screen.dart';

import 'package:doublem/features/sections&lessons/presentation/ui/screens/sections_screen.dart';
import 'package:doublem/features/settings/presentation/ui/screens/settings_screen.dart';
import 'package:doublem/features/signup/presentation/controllers/bloc/signup_verification_bloc.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/signup_screen.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/verification_screen.dart';
import 'package:doublem/features/splash/presentation/ui/screens/splash_screen.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_bloc.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_event.dart';
import 'package:doublem/features/teachers/presentation/ui/screens/teacher_screen.dart';
import 'package:doublem/features/teachers/presentation/ui/screens/teachers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static late RouterConfig<Object>? _routerConfigurations;
  static RouterConfig<Object>? get routerConfigurations =>
      _routerConfigurations;
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  // static final GlobalKey<NavigatorState> _shellNavigatorKey =
  //     GlobalKey<NavigatorState>();
  static void createRouter() {
    GoRouter goRouter = GoRouter(
      initialLocation: _initialRoute(),
      navigatorKey: _navigatorKey,
      routes: [
        GoRoute(
          path: SplashScreen.path,
          pageBuilder: (context, state) => MaterialPage(child: SplashScreen()),
        ),
        GoRoute(
          path: LoginScreen.path,
          pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
        ),
        ShellRoute(
          // parentNavigatorKey: _navigatorKey,
          // navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) => MaterialPage(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<TeachersBloc>(
                  create: (context) =>
                      getIt<TeachersBloc>()..add(LoadAllTeachersEvent()),
                ),
                BlocProvider<CoursesBloc>(
                  create: (context) =>
                      getIt<CoursesBloc>()..add(LoadAllCoursesEvent()),
                ),
                // BlocProvider<SectionsAndLessonsBloc>(
                //   create: (context) => getIt<SectionsAndLessonsBloc>(),
                // ),
              ],
              child: MainScreen(child: child),
            ),
          ),
          routes: [
            GoRoute(
              path: HomeScreen.path,
              pageBuilder: (context, state) =>
                  MaterialPage(child: HomeScreen()),
            ),
            GoRoute(
              path: TeachersScreen.path,
              pageBuilder: (context, state) =>
                  MaterialPage(child: TeachersScreen()),
            ),
            GoRoute(
              path: SettingsScreen.path,
              pageBuilder: (context, state) =>
                  MaterialPage(child: SettingsScreen()),
            ),
          ],
        ),
        GoRoute(
          path: SignupScreen.path,
          pageBuilder: (context, state) => MaterialPage(child: SignupScreen()),
        ),

        GoRoute(
          path: ForgotPasswordScreen.path,
          pageBuilder: (context, state) =>
              MaterialPage(child: ForgotPasswordScreen()),
        ),
        GoRoute(
          path: VerificationScreen.path,
          pageBuilder: (context, state) {
            String? email = state.extra as String?;
            return MaterialPage(
              child: BlocProvider<SignupVerificationBloc>(
                create: (context) => getIt<SignupVerificationBloc>(),
                child: VerificationScreen(
                  email: email ?? 'ahmedelmaghraby@gmail.com',
                ),
              ),
            );
          },
        ),
        GoRoute(
          path: ProfileScreen.path,
          pageBuilder: (context, state) => MaterialPage(child: ProfileScreen()),
        ),

        GoRoute(
          path: TeacherScreen.path,
          pageBuilder: (context, state) => MaterialPage(child: TeacherScreen()),
        ),
        GoRoute(
          path: CourseScreen.path,
          pageBuilder: (context, state) {
            EnrolledCourse courseEntity = state.extra as EnrolledCourse;

            return MaterialPage(
              child: BlocProvider<CoursesBloc>(
                create: (context) => getIt<CoursesBloc>()
                  ..add(
                    LoadCourseDetailsEvent(courseId: courseEntity.courseId),
                  ),
                child: CourseScreen(courseEntity: courseEntity),
              ),
            );
          },
        ),
        GoRoute(
          path: SectionsScreen.path,
          pageBuilder: (context, state) {
            List<SectionEntity> sections = state.extra as List<SectionEntity>;
            return MaterialPage(child: SectionsScreen(sections: sections));
          },
        ),
        GoRoute(
          path: LessonsScreen.path,
          pageBuilder: (context, state) {
            int sectionID = state.extra as int;
            return MaterialPage(
              child: BlocProvider(
                create: (context) =>
                    getIt<SectionsAndLessonsBloc>()
                      ..add(LoadLessonsBySectionEvent(sectionId: sectionID)),
                child: LessonsScreen(),
              ),
            );
          },
        ),
        GoRoute(
          path: LessonScreen.path,
          pageBuilder: (context, state) {
            LessonEntity lesson = state.extra as LessonEntity;
            return MaterialPage(child: LessonScreen(lessonsEntity: lesson));
          },
        ),

        GoRoute(
          path: QuizzesScreen.path,
          pageBuilder: (context, state) {
            List<QuizEntity> quizzes = state.extra as List<QuizEntity>;
            return MaterialPage(child: QuizzesScreen(quizzes: quizzes));
          },
        ),
        GoRoute(
          path: QuizScreen.path,
          pageBuilder: (context, state) {
            QuizEntity quizz = state.extra as QuizEntity;
            return MaterialPage(
              child: BlocProvider(
                create: (context) => getIt<QuizzesBloc>()
                  ..add(
                    LoadQuizEvent(quizId: quizz.id, courseId: quizz.courseId),
                  ),
                child: QuizScreen(quizEntity: quizz),
              ),
            );
          },
        ),

        GoRoute(
          path: NotificationsScreen.path,
          pageBuilder: (context, state) =>
              MaterialPage(child: NotificationsScreen()),
        ),
      ],
    );
    _routerConfigurations = goRouter;
  }

  static String _initialRoute() {
    bool? loggedIn = CacheUtils().getBool(key: 'LoggedIn');
    if (loggedIn == true) {
      return SplashScreen.path;
    } else {
      return LoginScreen.path;
    }
  }
}
