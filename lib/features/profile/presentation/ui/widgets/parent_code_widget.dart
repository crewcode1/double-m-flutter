import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/extensions/translation.dart';
import 'package:doublem/core/presentation/widgets/custom_button.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_bloc.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_event.dart';
import 'package:doublem/features/authentication/presentation/controllers/authentication_bloc/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentCodeWidget extends StatelessWidget {
  const ParentCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomButton(
              loading: state is GeneratingParentCode,
              onPressed: () {
                if (state is ParentCodeGenerated ||
                    state is GeneratingParentCode) {
                } else {
                  context.read<AuthenticationBloc>().add(
                    GeneratingParentCodeEvent(),
                  );
                }
              },
              title: (state is ParentCodeGenerated)
                  ? context.translations.close
                  : context.translations.generateParentCode,
              child: (state is ParentCodeGenerated)
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.h,
                        horizontal: 40.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.code, style: context.textTheme.titleLarge),
                          IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(text: state.code),
                              );
                            },
                            icon: Icon(
                              Icons.copy,
                              color: context.colorScheme.whiteColor,
                            ),
                            tooltip: context.translations.close,
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          ],
        );
      },
    );
  }
}
