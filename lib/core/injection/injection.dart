import 'package:doublem/core/injection/core_injection.dart';
import 'package:doublem/core/routes/app_router.dart';
import 'package:doublem/features/authentication/injection/authentication_injection.dart';
import 'package:doublem/features/course/injection/course_injection.dart';
import 'package:doublem/features/quizzes/injection/quizzes_injection.dart';
import 'package:doublem/features/sections&lessons/injection/sections_and_lessons_injection.dart';
import 'package:doublem/features/teachers/injection/teacher_injection.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void initGetIt() {
  // Routing
  AppRouter.createRouter();
  initCoreInjection();
  initAuthenticationInjection();
  initCoursesInjection();
  initSectionsInjection();
  initQuizzesInjection();
  initTeachersInjection();
}
