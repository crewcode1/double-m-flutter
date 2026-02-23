import 'dart:async';
import 'dart:math';

import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideo extends StatefulWidget {
  static final String path = '/full_screen_video';
  final VideoPlayerController controller;

  const FullScreenVideo({super.key, required this.controller});

  @override
  State<FullScreenVideo> createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  String? studentPhone;
  Timer? _timer;
  double start = 100;
  double top = 100;
  final Random random = Random();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startMovement();
    });
    studentPhone = CacheUtils().getString(key: 'userPhoneNumber');
    super.initState();
  }

  void startMovement() {
    _timer = Timer.periodic((const Duration(seconds: 5)), (_) {
      moveRandomly();
    });
  }

  void moveRandomly() {
    final Size size = MediaQuery.sizeOf(context);
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 2.16,
            child: Stack(
              children: [
                VideoPlayer(widget.controller),
                AnimatedPositionedDirectional(
                  start: start,
                  top: top,
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    studentPhone.toString(),
                    style: context.textTheme.titleMedium,
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
