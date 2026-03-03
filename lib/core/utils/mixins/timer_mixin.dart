import 'dart:async';

import 'package:flutter/material.dart';

mixin TimerMixin<T extends StatefulWidget> on State<T> {
  Timer? timer;
  late int secondsLeft = 0;

  void startTimer({required BuildContext context}) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft <= 0) {
        timer.cancel();
        submit(context: context);
      } else {
        setState(() {
          secondsLeft--;
        });
      }
    });
  }

  void submit({required BuildContext context});
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String get formattedTime {
    final minutes = (secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
