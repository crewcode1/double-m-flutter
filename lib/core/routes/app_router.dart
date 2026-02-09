import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/presentation/screens/splash_screen.dart';
import 'package:doublem/features/course/presentation/ui/screens/course_screen.dart';
import 'package:doublem/features/home/presentation/ui/screens/home_screen.dart';
import 'package:doublem/features/login/presentation/ui/screens/forgot_password_screen.dart';
import 'package:doublem/features/login/presentation/ui/screens/login_screen.dart';
import 'package:doublem/features/main/presentation/ui/screens/main_screen.dart';
import 'package:doublem/features/notifications/presentation/ui/screens/notifications_screen.dart';
import 'package:doublem/features/profile/presentation/ui/screens/profile_screen.dart';
import 'package:doublem/features/quizes/presentation/ui/screens/quiz_screen.dart';
import 'package:doublem/features/quizes/presentation/ui/screens/quizzes_screen.dart';
import 'package:doublem/features/sessions/presentation/ui/screens/session_screen.dart';
import 'package:doublem/features/sessions/presentation/ui/screens/sessions_screen.dart';
import 'package:doublem/features/settings/presentation/ui/screens/settings_screen.dart';
import 'package:doublem/features/signup/presentation/controllers/bloc/signup_verification_bloc.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/signup_screen.dart';
import 'package:doublem/features/authentication/presentation/ui/screens/verification_screen.dart';
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
      initialLocation: SplashScreen.path,
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
          pageBuilder: (context, state, child) =>
              MaterialPage(child: MainScreen(child: child)),
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
        GoRoute(
          path: CourseScreen.path,
          pageBuilder: (context, state) => MaterialPage(child: CourseScreen()),
        ),
        GoRoute(
          path: SessionsScreen.path,
          pageBuilder: (context, state) =>
              MaterialPage(child: SessionsScreen()),
        ),
        GoRoute(
          path: SessionScreen.path,
          pageBuilder: (context, state) => MaterialPage(child: SessionScreen()),
        ),
        GoRoute(
          path: QuizzesScreen.path,
          pageBuilder: (context, state) => MaterialPage(child: QuizzesScreen()),
        ),
        GoRoute(
          path: QuizScreen.path,
          pageBuilder: (context, state) => MaterialPage(child: QuizScreen()),
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
