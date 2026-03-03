import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/utils/mixins/moving_nuber_in_video_player_mixin.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;
  const CustomVideoPlayer({super.key, required this.controller});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer>
    with MovingNumberInVideoPlayerMixin {
  @override
  movingNumberchildInit() {
    size = Size(300.w, 240.h);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.controller.value.aspectRatio,
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
    );
  }
}
