import 'package:doublem/core/enums/types/alert_types.dart';
import 'package:doublem/core/enums/types/validation_type_enum.dart';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/helpers/validation_helper.dart';
import 'package:doublem/core/presentation/widgets/custom_button.dart';
import 'package:doublem/core/utils/presentation_utils/snack_bar.dart';
import 'package:doublem/features/authentication/presentation/ui/widgets/custom_form_field.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_bloc.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_event.dart';
import 'package:doublem/features/course/presentation/controllers/course_bloc/courses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddCourseModalBottomSheet extends StatefulWidget {
  const AddCourseModalBottomSheet({super.key});

  @override
  State<AddCourseModalBottomSheet> createState() =>
      _AddCourseModalBottomSheetState();
}

class _AddCourseModalBottomSheetState extends State<AddCourseModalBottomSheet> {
  late FocusNode focusNode;
  late TextEditingController _courseCodeController;
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    _courseCodeController = TextEditingController();
  }

  @override
  dispose() {
    focusNode.dispose();
    _courseCodeController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 393.w,
      height: focusNode.hasFocus
          ? (300 + MediaQuery.of(context).viewInsets.bottom).h
          : 300.h,
      child: BlocListener<CoursesBloc, CoursesState>(
        listener: (context, state) {
          if (state is CourseEnrollmentLoading) {
          } else if (state is CourseEnrollmentError) {
            context.pop();
            CustomSnackBar.showSnackBar(
              showCloseIcon: false,
              context,
              message: state.message,
              type: AlertType.failed,
              color: context.colorScheme.redColor,
              textColor: context.colorScheme.whiteColor,
            );
          } else if (state is CourseEnrolled) {
            context.pop();
          }
        },
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Text(context.translations.addCousreCode),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Form(
                key: _formKey,
                child: SigningFormField(
                  validator: (value) => ValidationHelper.validator(
                    validationType: ValidationType.empty,
                    context: context,
                    text: value,
                  ),
                  hint: context.translations.addCousreCode,
                  focusNode: focusNode,
                  controller: _courseCodeController,
                ),
              ),
            ),
            SizedBox(height: 30.h),

            BlocBuilder<CoursesBloc, CoursesState>(
              builder: (context, state) {
                return CustomButton(
                  loading: state is CourseEnrollmentLoading,
                  title: context.translations.addCourse,
                  onPressed: () {
                    if (state is CourseEnrollmentLoading) {
                    } else {
                      if (_formKey.currentState!.validate()) {
                        context.read<CoursesBloc>().add(
                          EnrollInCourseRequestEvent(
                            courseCode: _courseCodeController.text,
                          ),
                        );
                      }
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
