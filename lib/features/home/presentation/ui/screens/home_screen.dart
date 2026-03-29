import 'package:carousel_slider/carousel_slider.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_bloc.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_event.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_state.dart';
import 'package:doublem/features/home/presentation/ui/widgets/course_enrollment_modal_bottom_sheet.dart';
import 'package:doublem/features/home/presentation/ui/widgets/current_course_card.dart';
import 'package:doublem/features/home/presentation/ui/widgets/platform_teachers_card.dart';
import 'package:doublem/features/notifications/presentation/ui/screens/notifications_screen.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_bloc.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_event.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_state.dart';
import 'package:doublem/features/teachers/presentation/ui/screens/teachers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  static final String path = '/main_screen/home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CarouselSliderController _carouselSliderController;
  @override
  void initState() {
    super.initState();
    _carouselSliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: context.translations.home,
        actionsList: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 20.w),
            child: IconButton(
              onPressed: () {
                context.push(NotificationsScreen.path);
              },
              icon: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<TeachersBloc>().add(LoadAllTeachersEvent());
          context.read<CoursesBloc>().add(LoadAllCoursesEvent());
        },
        child: BlocListener<CoursesBloc, CoursesState>(
          listener: (context, state) {
            if (state is CoursesLoaded) {
              context.read<CoursesBloc>().add(LoadAllCoursesEvent());
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Assets.images.home.image(
                      width: 343.w,
                      height: 193.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 19.h)),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.translations.platformTeachers,
                        style: context.textTheme.headlineLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<TeachersBloc>().add(
                            LoadAllTeachersEvent(),
                          );
                          context.push(TeachersScreen.path);
                        },
                        child: Text(
                          context.translations.seeAll,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.blueColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 12.h)),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 150.h,
                    child: Center(
                      child: BlocBuilder<TeachersBloc, TeachersState>(
                        builder: (context, state) {
                          return (state is LoadingAllTeachersState)
                              ? CircularProgressIndicator.adaptive()
                              : (state is AllTeachersLoadedState)
                              ? CarouselSlider.builder(
                                  itemCount: state.teachers.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      PlatformTeachersCard(
                                        teacherEntity: state.teachers[index],
                                      ),
                                  carouselController: _carouselSliderController,
                                  options: CarouselOptions(
                                    height: 141.h,
                                    viewportFraction: 1.0,
                                    autoPlay: true,
                                    autoPlayAnimationDuration: const Duration(
                                      milliseconds: 500,
                                    ),
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state is FailedToLoadTeachersState
                                          ? state.message
                                          : context
                                                .translations
                                                .failedToLoadData,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context.read<TeachersBloc>().add(
                                          LoadAllTeachersEvent(),
                                        );
                                      },
                                      icon: Icon(Icons.refresh_outlined),
                                    ),
                                  ],
                                );
                        },
                      ),
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 19.h)),

                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.translations.currentCourses,
                        style: context.textTheme.headlineLarge,
                      ),

                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            useRootNavigator: true,
                            // isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return BlocProvider.value(
                                value: getIt<CoursesBloc>(),
                                child: AddCourseModalBottomSheet(),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.add_outlined),
                      ),
                    ],
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 19.h)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 182.h,
                    child: Center(
                      child: BlocBuilder<CoursesBloc, CoursesState>(
                        builder: (context, state) {
                          return (state is CoursesLoading)
                              ? CircularProgressIndicator.adaptive()
                              : (state is CoursesLoaded)
                              ? (state.courses.isEmpty)
                                    ? Text(
                                        context.translations.noCoursesAvaliable,
                                        style: context.textTheme.labelLarge,
                                      )
                                    : ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            SizedBox(width: 25.w),
                                        itemCount: state.courses.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                              return CurrentCourseCard(
                                                courseEntity:
                                                    state.courses[index],
                                              );
                                            },
                                      )
                              : Text(
                                  (state is CoursesError)
                                      ? (state.message.isEmpty)
                                            ? context
                                                  .translations
                                                  .failedToLoadData
                                            : state.message
                                      : context.translations.failedToLoadData,
                                );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
