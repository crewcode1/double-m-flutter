import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

mixin VideoPlayerCustomContolMixin<T extends StatefulWidget> on State<T> {
  bool isLoading = true;
  double currentSpeed = 1.0;
  late VideoPlayerController controller;

  void videoPlayerControllerchildInit() {}

  @override
  void initState() {
    videoPlayerControllerchildInit();
    super.initState();

    controller.initialize().then((_) {
      setState(() {
        isLoading = false;
      });
    });

    controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  void togglePlay() {
    controller.value.isPlaying ? controller.pause() : controller.play();
  }

  void forward10() {
    final position = controller.value.position;
    final duration = controller.value.duration;
    controller.seekTo(
      position + const Duration(seconds: 10) > duration
          ? duration
          : position + const Duration(seconds: 10),
    );
  }

  void backward10() {
    final position = controller.value.position;
    controller.seekTo(
      position - const Duration(seconds: 10) < Duration.zero
          ? Duration.zero
          : position - const Duration(seconds: 10),
    );
  }

  void restart() {
    controller.seekTo(Duration.zero);
  }

  void changeSpeed(double speed) {
    if (currentSpeed == speed) {
    } else {
      currentSpeed = speed;
      controller.setPlaybackSpeed(speed);
      setState(() {});
    }
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
