import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/presentation/screens/splash_screen.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/forgot_password_screen.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/login_screen.dart';
import 'package:doublem/features/course/domain/entities/course_entity.dart';
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
import 'package:doublem/features/sections&lessons/domain/entities/section_entity.dart';
import 'package:doublem/features/sections/presentation/ui/screens/section_screen.dart';

import 'package:doublem/features/sections/presentation/ui/screens/sections_screen.dart';
import 'package:doublem/features/settings/presentation/ui/screens/settings_screen.dart';
import 'package:doublem/features/signup/presentation/controllers/bloc/signup_verification_bloc.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/signup_screen.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/verification_screen.dart';
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
      initialLocation: HomeScreen.path,
      navigatorKey: _navigatorKey,
      routes: [
        // GoRoute(
        //   path: SplashScreen.path,
        //   pageBuilder: (context, state) => MaterialPage(child: SplashScreen()),
        // ),
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
        // GoRoute(
        //   path: MainScreen.path,
        //   pageBuilder: (context, state) => MaterialPage(child: MainScreen()),
        // ),
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
        // GoRoute(
        //   path: ProfileScreen.path,
        //   pageBuilder: (context, state) => MaterialPage(
        //     child: BlocProvider<AuthenticationBloc>(
        //       create: (context) =>
        //           getIt<AuthenticationBloc>()..add(LoadProfileRequested()),
        //       child: ProfileScreen(),
        //     ),
        //   ),
        // ),
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
          path: SectionScreen.path,
          pageBuilder: (context, state) {
            SectionEntity section = state.extra as SectionEntity;
            return MaterialPage(child: SectionScreen(sectionEntity: section));
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
                create: (context) =>
                    getIt<QuizzesBloc>()..add(LoadQuizEvent(quizId: quizz.id)),
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

        // Add Login route
        //     GoRoute(
        //       path: AppRoutes.loginScreenPath,
        //       pageBuilder: (context, state) {
        //         return CustomTransitionPage(
        //           transitionsBuilder: routingTransition,
        //           child: MultiBlocProvider(
        //             providers: [
        //               BlocProvider<ShowPasswordCubit>(
        //                 create: (context) => getIt<ShowPasswordCubit>(),
        //               ),
        //               BlocProvider<LogInCubit>(
        //                 create: (context) => getIt<LogInCubit>(),
        //               ),
        //             ],
        //             child: LoginScreen(),
        //           ),
        //         );
        //       },
        //     ),

        //     // Add Initial route
        //     GoRoute(
        //       path: AppRoutes.initialScreenPath,
        //       pageBuilder: (context, state) {
        //         bool? isLoggedIn = CacheUtilsImplementation.getBool("LoggedIn") ?? false;

        //         if (isLoggedIn) {
        //           UniqueKey? extra = state.extra as UniqueKey?;
        //           bool? isManager = CacheUtilsImplementation.getBool('empType') ?? false;
        //           return CustomTransitionPage(
        //             transitionsBuilder: routingTransition,
        //             child: MultiBlocProvider(
        //               providers: [
        //                 BlocProvider<NotificationsCubit>(
        //                   create: (context) => getIt<NotificationsCubit>(),
        //                 ),
        //                 BlocProvider<SaveRequestActionCubit>(
        //                   create: (context) => getIt<SaveRequestActionCubit>(),
        //                 ),
        //                 BlocProvider<GetEmployeeRequestCubit>(
        //                   create: (context) => getIt<GetEmployeeRequestCubit>(),
        //                 ),
        //                 BlocProvider<GetEmployeeRequestCubit>(
        //                   create: (context) => getIt<GetEmployeeRequestCubit>(),
        //                 ),
        //                 BlocProvider<ResumeWorkCubit>(
        //                   create: (context) =>
        //                       getIt<ResumeWorkCubit>()..getResumeWorkStatus(),
        //                 ),
        //               ],
        //               child: HomeScreen(isManager: isManager, key: extra),
        //             ),
        //           );
        //         } else {
        //           return CustomTransitionPage(
        //             transitionsBuilder: routingTransition,

        //             child: MultiBlocProvider(
        //               providers: [
        //                 BlocProvider<ShowPasswordCubit>(
        //                   create: (context) => getIt<ShowPasswordCubit>(),
        //                 ),
        //                 BlocProvider<LogInCubit>(
        //                   create: (context) => getIt<LogInCubit>(),
        //                 ),
        //               ],
        //               child: LoginScreen(),
        //             ),
        //           );
        //         }
        //       },
        //     ),

        //     // Add Home route
        //     GoRoute(
        //       path: AppRoutes.homeScreenPath,
        //       pageBuilder: (context, state) {
        //         bool? isManager = CacheUtilsImplementation.getBool('empType') ?? false;
        //         UniqueKey? uniqueKey = state.extra as UniqueKey?;
        //         return CustomTransitionPage(
        //           transitionsBuilder: routingTransition,
        //           child: MultiBlocProvider(
        //             providers: [
        //               BlocProvider<NotificationsCubit>(
        //                 create: (context) => getIt<NotificationsCubit>(),
        //               ),
        //               BlocProvider<GetEmployeeRequestCubit>(
        //                 create: (context) => getIt<GetEmployeeRequestCubit>(),
        //               ),
        //               BlocProvider<SaveRequestActionCubit>(
        //                 create: (context) => getIt<SaveRequestActionCubit>(),
        //               ),
        //               BlocProvider<ResumeWorkCubit>(
        //                 create: (context) =>
        //                     getIt<ResumeWorkCubit>()..getResumeWorkStatus(),
        //               ),
        //             ],
        //             child: HomeScreen(isManager: isManager, key: uniqueKey),
        //           ),
        //         );
        //       },
        //     ),

        //     // Add Notifications route
        //     GoRoute(
        //       path: AppRoutes.notificationsScreenPath,
        //       pageBuilder: (context, state) {
        //         return CustomTransitionPage(
        //           transitionsBuilder: routingTransition,
        //           child: BlocProvider<NotificationsCubit>(
        //             create: (context) => getIt<NotificationsCubit>(),
        //             child: NotificationsScreen(),
        //           ),
        //         );
        //       },
        //     ),
        //     // Add History route
        //     GoRoute(
        //       path: AppRoutes.historyScreenPath,
        //       pageBuilder: (context, state) {
        //         return CustomTransitionPage(
        //           transitionsBuilder: routingTransition,
        //           child: MultiBlocProvider(
        //             providers: [
        //               BlocProvider<GetEmployeeRequestCubit>(
        //                 create: (context) => getIt<GetEmployeeRequestCubit>(),
        //               ),
        //             ],
        //             child: HistoryScreen(),
        //           ),
        //         );
        //       },
        //     ),
        //     // Add History route
        //     GoRoute(
        //       path: AppRoutes.managerHistoryScreenPath,
        //       pageBuilder: (context, state) {
        //         return CustomTransitionPage(
        //           transitionsBuilder: routingTransition,
        //           child: MultiBlocProvider(
        //             providers: [
        //               BlocProvider<GetManagerHistoryCubit>(
        //                 create: (context) => getIt<GetManagerHistoryCubit>(),
        //               ),
        //             ],
        //             child: ManagerHistoryScreen(),
        //           ),
        //         );
        //       },
        //     ),

        //     // Add Requests route
        //     GoRoute(
        //       path: AppRoutes.requestsScreenPath,
        //       pageBuilder: (context, state) {
        //         return CustomTransitionPage(
        //           transitionsBuilder: routingTransition,
        //           child: MultiBlocProvider(
        //             providers: [
        //               BlocProvider<GetAvaliableRequestsTypesCubit>(
        //                 create: (context) =>
        //                     getIt<GetAvaliableRequestsTypesCubit>(),
        //               ),
        //               BlocProvider<AppBarCubit>(
        //                 create: (context) => getIt<AppBarCubit>(),
        //               ),
        //             ],
        //             child: const RequestsScreen(),
        //           ),
        //         );
        //       },
        //     ),
        //     // Add Request Details route
        //     GoRoute(
        //       path: AppRoutes.requestDetailsScreenPath,
        //       pageBuilder: (context, state) {
        //         final Map<String, dynamic> pathParameters = state.pathParameters;
        //         Map<String, dynamic>? extra = state.extra as Map<String, dynamic>?;
        //         final int? approveState = extra?['approveState'] as int?;
        //         final int? notificationID = extra?['notificationID'] as int?;
        //         final bool? commingFromNotificationsScreen =
        //             extra?['commingFromNotificationsScreen'] as bool?;

        //         return CustomTransitionPage(
        //           transitionsBuilder: routingTransition,
        //           child: MultiBlocProvider(
        //             providers: [
        //               BlocProvider<GetRequestDetailsCubit>(
        //                 create: (context) => getIt<GetRequestDetailsCubit>(),
        //               ),
        //               BlocProvider<SaveRequestActionCubit>(
        //                 create: (context) => getIt<SaveRequestActionCubit>(),
        //               ),
        //             ],
        //             child: RequestDetailsScreen(
        //               masterId: int.parse(pathParameters['masterID']),
        //               requestId: int.parse(pathParameters['requestID']),
        //               actionType: int.parse(pathParameters['actionType']),
        //               approveState: approveState,
        //               notificationID: notificationID,
        //               fromNotificationsScreen: commingFromNotificationsScreen,
        //             ),
        //           ),
        //         );
        //       },
        //     ),

        //     // Add Settings route
        //     GoRoute(
        //       path: AppRoutes.settingsScreenPath,
        //       pageBuilder: (context, state) {
        //         return CustomTransitionPage(
        //           transitionsBuilder: routingTransition,
        //           child: const SettingsScreen(),
        //         );
        //       },
        //     ),

        //     GoRoute(
        //       path: AppRoutes.clientregistrationScreen,
        //       pageBuilder: (context, state) {
        //         return CustomTransitionPage(
        //           transitionsBuilder: routingTransition,
        //           child: BlocProvider<DailyRegistrationCubit>(
        //             create: (context) =>
        //                 getIt<DailyRegistrationCubit>()
        //                   ..getDailyRegistrationStatus(),
        //             child: const DailyregistrationScreen(),
        //           ),
        //         );
        //       },
        //     ),
      ],
    );
    _routerConfigurations = goRouter;
  }
}
