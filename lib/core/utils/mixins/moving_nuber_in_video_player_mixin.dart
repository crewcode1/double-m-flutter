import 'dart:async';
import 'dart:math';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:flutter/material.dart';

mixin MovingNumberInVideoPlayerMixin<T extends StatefulWidget> on State<T> {
  String? studentPhone;
  Timer? _timer;
  double start = 100;
  double top = 100;
  final Random random = Random();
  late Size size;
  void movingNumberChildInit() {}

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startMovement();
    });
    studentPhone = CacheUtils().getString(key: 'userPhoneNumber');
    movingNumberChildInit();
    super.initState();
  }

  void startMovement() {
    _timer = Timer.periodic((const Duration(seconds: 5)), (_) {
      moveRandomly();
    });
  }

  void moveRandomly() {
    const widgetWidth = 100;
    const widgetHeight = 60;
    final maxLeft = (size.width) - widgetWidth;
    final maxTop = (size.height) - widgetHeight;
    setState(() {
      start = random.nextDouble() * maxLeft;
      top = random.nextDouble() * maxTop;
    });
  }

  void movingNumberchilldDispose() {
    _timer?.cancel();
  }
}
