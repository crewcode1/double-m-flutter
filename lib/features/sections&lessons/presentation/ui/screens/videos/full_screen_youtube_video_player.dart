import 'dart:async';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:doublem/core/utils/mixins/moving_nuber_in_video_player_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullScreenYoutubeVideoPlayer extends StatefulWidget {
  static final String path = '/youtube_full_screen_video';
  final YoutubePlayerController controller;

  const FullScreenYoutubeVideoPlayer({super.key, required this.controller});

  @override
  State<FullScreenYoutubeVideoPlayer> createState() =>
      _FullScreenYoutubeVideoPlayerState();
}

class _FullScreenYoutubeVideoPlayerState
    extends State<FullScreenYoutubeVideoPlayer>
    with MovingNumberInVideoPlayerMixin {
  Timer? _timer;
  @override
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
    widget.controller.play();
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
        child: Center(
          child: AspectRatio(
            aspectRatio: 2.16,
            child: Stack(
              children: [
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: widget.controller,
                    showVideoProgressIndicator: false,
                    bufferIndicator: const SizedBox(),
                    progressIndicatorColor: context.colorScheme.transparent,
                    bottomActions: [
                      CurrentPosition(controller: widget.controller),
                      ProgressBar(
                        isExpanded: true,
                        controller: widget.controller,
                        colors: ProgressBarColors(
                          backgroundColor: context.colorScheme.greyColor,
                          playedColor: context.colorScheme.redColor,
                          handleColor: context.colorScheme.whiteColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          size: 34,
                          color: context.colorScheme.whiteColor,
                          Icons.fullscreen,
                        ),
                      ),
                    ],
                  ),
                  builder: (context, player) => Column(children: [player]),
                ),

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
