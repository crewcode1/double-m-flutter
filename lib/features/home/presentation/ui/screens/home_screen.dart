import 'package:carousel_slider/carousel_slider.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/generated/generated_assets/assets.gen.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/home/presentation/ui/widgets/current_course_card.dart';
import 'package:doublem/features/home/presentation/ui/widgets/platform_teachers_card.dart';
import 'package:doublem/features/notifications/presentation/ui/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
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
      body: Padding(
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
              child: Text(
                "Platform teachers",
                style: context.textTheme.headlineLarge,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 12.h)),

            SliverToBoxAdapter(
              child: CarouselSlider(
                carouselController: _carouselSliderController,
                options: CarouselOptions(
                  height: 141.h,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                ),
                items: [
                  PlatformTeachersCard(),
                  PlatformTeachersCard(),
                  PlatformTeachersCard(),
                  PlatformTeachersCard(),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 19.h)),

            SliverToBoxAdapter(
              child: Text(
                "current courses",
                style: context.textTheme.headlineLarge,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 19.h)),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 182.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 25.w),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CurrentCourseCard();
                  },
                ),
              ),
            ),

            // ============ EXPANDED (IMPORTANT!!) ============
            // Expanded(
            //   child: BlocBuilder<CoursesBloc, CoursesState>(
            //     builder: (context, state) {
            //       if (state.loading) {
            //         return const Center(child: CircularProgressIndicator());
            //       }

            //       final courses = state.courses ?? [];

            //       return GridView.builder(
            //         padding: const EdgeInsets.only(bottom: 20),
            //         physics: const BouncingScrollPhysics(),
            //         itemCount: courses.length,
            //         gridDelegate:
            //             const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 2,
            //               mainAxisSpacing: 16,
            //               crossAxisSpacing: 16,
            //               childAspectRatio: 0.80,
            //             ),
            //         itemBuilder: (context, index) {
            //           return CurrentCourseCard();
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
