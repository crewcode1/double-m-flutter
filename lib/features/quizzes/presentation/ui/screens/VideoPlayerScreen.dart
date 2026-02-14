// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final String videoUrl;
//   const VideoPlayerScreen({super.key, required this.videoUrl});

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   VideoPlayerController? videoController;
//   ChewieController? chewieController;

//   @override
//   void initState() {
//     super.initState();

//     videoController = VideoPlayerController.network(widget.videoUrl);
//     videoController!.initialize().then((_) {
//       chewieController = ChewieController(
//         videoPlayerController: videoController!,
//         autoPlay: true,
//         looping: false,
//       );
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     videoController?.dispose();
//     chewieController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF000000),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF000000),
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Center(
//         child: chewieController != null &&
//             chewieController!.videoPlayerController.value.isInitialized
//             ? Chewie(controller: chewieController!)
//             : const CircularProgressIndicator(color: Colors.white),
//       ),
//     );
//   }
// }
