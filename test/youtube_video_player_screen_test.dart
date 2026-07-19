import 'package:doublem/features/sections&lessons/presentation/ui/screens/videos/youtube_video_player_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('extractVideoIdFromUrl', () {
    test('extracts a video id from a youtube watch URL', () {
      expect(
        extractVideoIdFromUrl(
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ&t=10s',
        ),
        'dQw4w9WgXcQ',
      );
    });

    test('extracts a video id from a youtu.be URL', () {
      expect(
        extractVideoIdFromUrl('https://youtu.be/dQw4w9WgXcQ?t=42'),
        'dQw4w9WgXcQ',
      );
    });

    test('returns an empty string for an invalid URL', () {
      expect(extractVideoIdFromUrl('not a valid url'), isEmpty);
    });
  });

  group('preferredOrientationsForFullscreen', () {
    test('returns landscape orientations when entering fullscreen', () {
      expect(preferredOrientationsForFullscreen(true), [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });

    test('returns portrait orientation when exiting fullscreen', () {
      expect(preferredOrientationsForFullscreen(false), [
        DeviceOrientation.portraitUp,
      ]);
    });
  });
}
