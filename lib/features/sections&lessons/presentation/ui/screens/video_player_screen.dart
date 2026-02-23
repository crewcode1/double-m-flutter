import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/features/sections&lessons/presentation/ui/screens/full_screen_video.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool isLoading = true;
  double currentSpeed = 1.0;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    _controller.initialize().then((_) {
      setState(() {
        isLoading = false;
      });
    });

    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void togglePlay() {
    _controller.value.isPlaying ? _controller.pause() : _controller.play();
  }

  void forward10() {
    final position = _controller.value.position;
    final duration = _controller.value.duration;
    _controller.seekTo(
      position + const Duration(seconds: 10) > duration
          ? duration
          : position + const Duration(seconds: 10),
    );
  }

  void backward10() {
    final position = _controller.value.position;
    _controller.seekTo(
      position - const Duration(seconds: 10) < Duration.zero
          ? Duration.zero
          : position - const Duration(seconds: 10),
    );
  }

  void restart() {
    _controller.seekTo(Duration.zero);
  }

  void changeSpeed(double speed) {
    if (currentSpeed == speed) {
    } else {
      currentSpeed = speed;
      _controller.setPlaybackSpeed(speed);
      setState(() {});
    }
  }

  void openFullScreen() async {
    context.push(FullScreenVideo.path, extra: _controller);
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final position = _controller.value.position;
    final duration = _controller.value.duration;

    return SizedBox(
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                /// Video with BorderRadius + Shadow
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                ),

                /// Slider
                Slider(
                  value: position.inSeconds.toDouble().clamp(
                    0,
                    duration.inSeconds.toDouble(),
                  ),
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    _controller.seekTo(Duration(seconds: value.toInt()));
                  },
                ),

                Text(
                  "${formatDuration(position)} / ${formatDuration(duration)}",
                ),

                const SizedBox(height: 10),

                /// Control Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.replay_10),
                      onPressed: backward10,
                    ),
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: togglePlay,
                    ),
                    IconButton(
                      icon: const Icon(Icons.forward_10),
                      onPressed: forward10,
                    ),
                    IconButton(
                      icon: const Icon(Icons.restart_alt),
                      onPressed: restart,
                    ),
                    IconButton(
                      icon: const Icon(Icons.fullscreen),
                      onPressed: openFullScreen,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        changeSpeed(0.5);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.h,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((12.5).r),
                          color: (currentSpeed == 0.5)
                              ? context.colorScheme.primaryColor
                              : context.colorScheme.whiteColor,
                        ),
                        child: Text(
                          "0.5x",
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: (currentSpeed == 0.5)
                                ? context.colorScheme.whiteColor
                                : context.colorScheme.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        changeSpeed(1.0);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.h,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((12.5).r),
                          color: (currentSpeed == 1.0)
                              ? context.colorScheme.primaryColor
                              : context.colorScheme.whiteColor,
                        ),
                        child: Text(
                          "1.0x",
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: (currentSpeed == 1.0)
                                ? context.colorScheme.whiteColor
                                : context.colorScheme.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        changeSpeed(1.5);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.h,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((12.5).r),
                          color: (currentSpeed == 1.5)
                              ? context.colorScheme.primaryColor
                              : context.colorScheme.whiteColor,
                        ),
                        child: Text(
                          "1.5x",
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: (currentSpeed == 1.5)
                                ? context.colorScheme.whiteColor
                                : context.colorScheme.primaryColor,
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        changeSpeed(2.0);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.h,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((12.5).r),
                          color: (currentSpeed == 2.0)
                              ? context.colorScheme.primaryColor
                              : context.colorScheme.whiteColor,
                        ),
                        child: Text(
                          "2.0x",
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: (currentSpeed == 2.0)
                                ? context.colorScheme.whiteColor
                                : context.colorScheme.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// Speed Control
              ],
            ),
    );
  }
}
