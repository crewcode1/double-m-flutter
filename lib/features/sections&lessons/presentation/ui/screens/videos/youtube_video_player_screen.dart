import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/extensions/theme.dart';
import 'package:doublem/core/utils/mixins/moving_nuber_in_video_player_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

String extractVideoIdFromUrl(String url) {
  final uri = Uri.tryParse(url);

  if (uri == null || !uri.hasScheme) {
    return '';
  }

  if (uri.host.contains('youtu.be')) {
    return uri.pathSegments.isNotEmpty ? uri.pathSegments.first : '';
  }

  return uri.queryParameters['v'] ?? '';
}

List<DeviceOrientation> preferredOrientationsForFullscreen(bool isFullscreen) {
  if (isFullscreen) {
    return [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight];
  }

  return [DeviceOrientation.portraitUp];
}

class YouTubeVideoScreen extends StatefulWidget {
  final String videoUrl;

  const YouTubeVideoScreen({super.key, required this.videoUrl});

  @override
  State<YouTubeVideoScreen> createState() => _YouTubeVideoScreenState();
}

class _YouTubeVideoScreenState extends State<YouTubeVideoScreen>
    with MovingNumberInVideoPlayerMixin {
  late final YoutubePlayerController _controller;

  String extractVideoId({required String url}) {
    return extractVideoIdFromUrl(url);
  }

  void _handleFullscreenChanged(bool isFullscreen) {
    SystemChrome.setPreferredOrientations(
      preferredOrientationsForFullscreen(isFullscreen),
    );
  }

  @override
  void movingNumberChildInit() {
    final videoId = extractVideoId(url: widget.videoUrl);

    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
    _controller.setFullScreenListener(_handleFullscreenChanged);
    _handleFullscreenChanged(false);
  }

  @override
  void dispose() {
    _handleFullscreenChanged(false);
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.r),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayer(controller: _controller),
          ),

          AnimatedPositionedDirectional(
            start: start,
            top: top,
            duration: const Duration(milliseconds: 800),
            child: IgnorePointer(
              child: Text(
                studentPhone.toString(),
                style: context.textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
