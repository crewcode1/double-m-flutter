import 'dart:async';
import 'package:doublem/core/extensions/screen_size.dart';
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
  bool _showControls = true;

  @override
  void initState() {
    controller = widget.controller;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startMovement();
      _restartControlsTimer();
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

  void _restartControlsTimer() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted && _showControls) {
        setState(() {
          _showControls = false;
        });
      }
    });
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
    if (_showControls) {
      _restartControlsTimer();
    } else {
      _timer?.cancel();
    }
  }

  Future<void> _togglePlayback() async {
    if (!widget.controller.value.isInitialized) return;

    if (widget.controller.value.isPlaying) {
      await widget.controller.pause();
    } else {
      if (widget.controller.value.position >=
          widget.controller.value.duration) {
        await widget.controller.seekTo(Duration.zero);
      }
      await widget.controller.play();
    }

    if (mounted) {
      _restartControlsTimer();
    }
  }

  Future<void> _seekBy(int seconds) async {
    if (!widget.controller.value.isInitialized) return;

    final currentPosition = widget.controller.value.position;
    final target = currentPosition + Duration(seconds: seconds);
    await widget.controller.seekTo(
      target < Duration.zero ? Duration.zero : target,
    );

    if (mounted) {
      _restartControlsTimer();
    }
  }

  Future<void> _seekTo(double value) async {
    if (!widget.controller.value.isInitialized) return;

    final duration = widget.controller.value.duration;

    final target = Duration(
      milliseconds: (duration.inMilliseconds * value).round(),
    );
    await widget.controller.seekTo(target);

    if (mounted) {
      _restartControlsTimer();
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    if (duration.inHours > 0) {
      return '$hours:$minutes:$seconds';
    }

    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ValueListenableBuilder<VideoPlayerValue>(
          valueListenable: widget.controller,
          builder: (context, value, _) {
            final sliderValue = value.duration.inMilliseconds > 0
                ? (value.position.inMilliseconds /
                          value.duration.inMilliseconds)
                      .clamp(0.0, 1.0)
                : 0.0;

            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _toggleControls,
              onDoubleTapDown: (details) {
                final isLeftSide =
                    details.localPosition.dx <
                    (MediaQuery.sizeOf(context).width / 2);
                _seekBy(isLeftSide ? -10 : 10);
              },
              child: Center(
                child: AspectRatio(
                  aspectRatio: 2.16,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      VideoPlayer(widget.controller),
                      AnimatedOpacity(
                        opacity: _showControls ? 1 : 0,
                        duration: const Duration(milliseconds: 250),
                        child: IgnorePointer(
                          ignoring: !_showControls,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned.fill(
                                child: Container(color: Colors.black54),
                              ),
                              Positioned(
                                top: 16,
                                right: 16,
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.fullscreen_exit),
                                  color: Colors.white,
                                  iconSize: 28,
                                ),
                              ),
                              Center(
                                child: IconButton(
                                  onPressed: _togglePlayback,
                                  icon: Icon(
                                    value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                  color: Colors.white,
                                  iconSize: 56,
                                ),
                              ),
                              Positioned(
                                left: 16,
                                right: 16,
                                bottom: 24,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          _formatDuration(value.position),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          _formatDuration(value.duration),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: Colors.white,
                                        inactiveTrackColor: Colors.white38,
                                        thumbColor: Colors.white,
                                        overlayColor: Colors.white24,
                                      ),
                                      child: Slider(
                                        value: sliderValue,
                                        onChanged: (newValue) async {
                                          await _seekTo(newValue);
                                        },
                                        onChangeStart: (_) {
                                          _timer?.cancel();
                                        },
                                        onChangeEnd: (_) {
                                          _restartControlsTimer();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
            );
          },
        ),
      ),
    );
  }
}
