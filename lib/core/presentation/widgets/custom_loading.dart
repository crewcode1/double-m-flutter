import 'package:flutter/material.dart';

class CustomLoading {
  static void showLoadingWidget(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CustomLoadingWidget(),
    );
  }
}

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
