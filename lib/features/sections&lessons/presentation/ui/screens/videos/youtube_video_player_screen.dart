import 'dart:developer';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/utils/mixins/moving_nuber_in_video_player_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoScreen extends StatefulWidget {
  final String videoUrl;

  const YouTubeVideoScreen({super.key, required this.videoUrl});

  @override
  State<YouTubeVideoScreen> createState() => _YouTubeVideoScreenState();
}

class _YouTubeVideoScreenState extends State<YouTubeVideoScreen>
    with MovingNumberInVideoPlayerMixin {
  bool isLoading = true;
  bool hasError = false;
  bool isFullScreen = false;

  late YoutubePlayerController _controller;

  @override
  void movingNumberChildInit() {
    size = Size(300.w, 240.h);
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '';
    log(videoId.toString());

    _controller = YoutubePlayerController(
      flags: const YoutubePlayerFlags(mute: false),
      initialVideoId: videoId,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (isFullScreen ? 880 : 240).h,
      width: (isFullScreen ? 800 : 350).w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            YoutubePlayerBuilder(
              onEnterFullScreen: () {
                setState(() {
                  isFullScreen = true;
                });
              },
              onExitFullScreen: () {
                setState(() {
                  isFullScreen = false;
                });
              },
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: false,
                bufferIndicator: const SizedBox(),
                progressIndicatorColor: context.colorScheme.transparent,
                bottomActions: [
                  CurrentPosition(controller: _controller),
                  ProgressBar(
                    isExpanded: true,
                    controller: _controller,
                    colors: ProgressBarColors(
                      backgroundColor: context.colorScheme.greyColor,
                      playedColor: context.colorScheme.redColor,
                      handleColor: context.colorScheme.whiteColor,
                    ),
                  ),
                  FullScreenButton(controller: _controller),
                ],
              ),
              builder: (context, player) => player,
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
    );
    // return isLoading
    //     ? const Center(child: CircularProgressIndicator())
    //     : hasError
    //     ? Text(context.translations.failedToLoadData)
    //     : Column(
    //         children: [
    //           /// Video with BorderRadius + Shadow
    //           Padding(
    //             padding: const EdgeInsets.all(16),
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //               ),
    //               child: AspectRatio(
    //                 aspectRatio: 16 / 9,
    //                 child: YoutubePlayer(controller: _controller),
    //               ),
    //             ),
    //           ),
    //         ],
    //       );
  }
}

// import 'package:doublem/core/extensions/screen_size.dart';
// import 'package:doublem/core/extensions/theme.dart';
// import 'package:doublem/core/utils/mixins/moving_nuber_in_video_player_mixin.dart';
// import 'package:doublem/core/utils/mixins/video_player_custom_control_mixin.dart';
// import 'package:doublem/features/sections&lessons/presentation/ui/screens/videos/full_screen_video.dart';
// import 'package:doublem/features/sections&lessons/presentation/ui/widgets/video_mini.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:video_player/video_player.dart';

// class YouTubeVideoPlayer extends StatefulWidget {
//   final String videoUrl;

//   const YouTubeVideoPlayer({super.key, required this.videoUrl});

//   @override
//   State<YouTubeVideoPlayer> createState() => YouTubeVideoPlayerState();
// }

// class YouTubeVideoPlayerState extends State<YouTubeVideoPlayer>
//     with VideoPlayerCustomContolMixin, MovingNumberInVideoPlayerMixin {
//   @override
//   videoPlayerControllerchildInit() {
//     controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//   }

//   @override
//   void dispose() {
//     movingNumberchilldDispose();
//     controller.dispose();
//     super.dispose();
//   }

//   void openFullScreen() async {
//     context.push(FullScreenVideo.path, extra: controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final position = controller.value.position;
//     final duration = controller.value.duration;

//     return SizedBox(
//       child: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Column(
//               children: [
//                 /// Video with BorderRadius + Shadow
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: CustomVideoPlayer(controller: controller),
//                   ),
//                 ),

//                 /// Slider
//                 Slider(
//                   value: position.inSeconds.toDouble().clamp(
//                     0,
//                     duration.inSeconds.toDouble(),
//                   ),
//                   min: 0,
//                   max: duration.inSeconds.toDouble(),
//                   onChanged: (value) {
//                     controller.seekTo(Duration(seconds: value.toInt()));
//                   },
//                 ),

//                 Text(
//                   "${formatDuration(position)} / ${formatDuration(duration)}",
//                 ),

//                 const SizedBox(height: 10),

//                 /// Control Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.replay_10),
//                       onPressed: backward10,
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         controller.value.isPlaying
//                             ? Icons.pause
//                             : Icons.play_arrow,
//                       ),
//                       onPressed: togglePlay,
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.forward_10),
//                       onPressed: forward10,
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.restart_alt),
//                       onPressed: restart,
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.fullscreen),
//                       onPressed: openFullScreen,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         changeSpeed(0.5);
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 6.h,
//                           horizontal: 12.w,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular((12.5).r),
//                           color: (currentSpeed == 0.5)
//                               ? context.colorScheme.primaryColor
//                               : context.colorScheme.whiteColor,
//                         ),
//                         child: Text(
//                           "0.5x",
//                           style: context.textTheme.bodyLarge?.copyWith(
//                             color: (currentSpeed == 0.5)
//                                 ? context.colorScheme.whiteColor
//                                 : context.colorScheme.primaryColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         changeSpeed(1.0);
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 6.h,
//                           horizontal: 12.w,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular((12.5).r),
//                           color: (currentSpeed == 1.0)
//                               ? context.colorScheme.primaryColor
//                               : context.colorScheme.whiteColor,
//                         ),
//                         child: Text(
//                           "1.0x",
//                           style: context.textTheme.bodyLarge?.copyWith(
//                             color: (currentSpeed == 1.0)
//                                 ? context.colorScheme.whiteColor
//                                 : context.colorScheme.primaryColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         changeSpeed(1.5);
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 6.h,
//                           horizontal: 12.w,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular((12.5).r),
//                           color: (currentSpeed == 1.5)
//                               ? context.colorScheme.primaryColor
//                               : context.colorScheme.whiteColor,
//                         ),
//                         child: Text(
//                           "1.5x",
//                           style: context.textTheme.bodyLarge?.copyWith(
//                             color: (currentSpeed == 1.5)
//                                 ? context.colorScheme.whiteColor
//                                 : context.colorScheme.primaryColor,
//                           ),
//                         ),
//                       ),
//                     ),

//                     GestureDetector(
//                       onTap: () {
//                         changeSpeed(2.0);
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 6.h,
//                           horizontal: 12.w,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular((12.5).r),
//                           color: (currentSpeed == 2.0)
//                               ? context.colorScheme.primaryColor
//                               : context.colorScheme.whiteColor,
//                         ),
//                         child: Text(
//                           "2.0x",
//                           style: context.textTheme.bodyLarge?.copyWith(
//                             color: (currentSpeed == 2.0)
//                                 ? context.colorScheme.whiteColor
//                                 : context.colorScheme.primaryColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 10),

//                 /// Speed Control
//               ],
//             ),
//     );
//   }
// }
