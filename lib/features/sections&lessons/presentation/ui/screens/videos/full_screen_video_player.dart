import 'dart:async';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:doublem/core/utils/mixins/video_player_custom_control_mixin.dart';
import 'package:doublem/core/utils/mixins/moving_nuber_in_video_player_mixin.dart';
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

class _FullScreenVideoState extends State<FullScreenVideo>
    with MovingNumberInVideoPlayerMixin, VideoPlayerCustomContolMixin {
  Timer? _timer;
  @override
  @override
  void initState() {
    controller = widget.controller;
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.sizeOf(context);
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
        child: GestureDetector(
          onTap: () {
            togglePlay();
          },
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
      ),
    );
  }
}
