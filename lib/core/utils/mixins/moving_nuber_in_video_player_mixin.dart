import 'dart:async';
import 'dart:math';
import 'package:doublem/core/extensions/screen_size.dart';
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
    size = Size(300.w, 240.h);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startMovement();
    });
    studentPhone = CacheUtils().getString(key: 'userPhoneNumber');
    movingNumberChildInit();
    super.initState();
  }

  void startMovement() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      moveRandomly();
    });
  }

  void moveRandomly() {
    if (!mounted) return;

    const widgetWidth = 100;
    const widgetHeight = 60;
    final maxLeft = (size.width) - widgetWidth;
    final maxTop = (size.height) - widgetHeight;
    setState(() {
      start = random.nextDouble() * maxLeft;
      top = random.nextDouble() * maxTop;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void movingNumberchilldDispose() {
    _timer?.cancel();
    _timer = null;
  }
}
