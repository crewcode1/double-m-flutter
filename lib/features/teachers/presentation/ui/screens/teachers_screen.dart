import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_app_bar.dart';
import 'package:doublem/features/home/presentation/ui/widgets/platform_teachers_card.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_bloc.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_event.dart';
import 'package:doublem/features/teachers/presentation/controllers/teacher_bloc/teacher_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeachersScreen extends StatelessWidget {
  static final String path = '/main_screen/teachers_screen';
  const TeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.translations.teachers),
      body: Center(
        child: BlocBuilder<TeachersBloc, TeachersState>(
          builder: (context, state) {
            return (state is LoadingAllTeachersState)
                ? CircularProgressIndicator.adaptive()
                : (state is AllTeachersLoadedState)
                ? ListView.separated(
                    padding: EdgeInsetsDirectional.only(
                      start: 25.w,
                      end: 25.w,
                      top: 10.h,
                      bottom: 20.h,
                    ),
                    itemCount: state.teachers.length,
                    itemBuilder: (context, index) => PlatformTeachersCard(
                      teacherEntity: state.teachers[index],
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 20.h),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state is FailedToLoadTeachersState
                            ? state.message
                            : context.translations.failedToLoadData,
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
    );
  }
}
