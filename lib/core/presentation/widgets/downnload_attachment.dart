// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:doublem/core/enums/types/alert_types.dart';
// import 'package:doublem/core/extensions/theme.dart';
// import 'package:doublem/core/injection/injection.dart';
// import 'package:doublem/core/presentation/widgets/custom_loading.dart';
// import 'package:doublem/core/services/abstraction/api_services.dart';
// import 'package:doublem/core/utils/implementation/file_helper.dart';
// import 'package:doublem/core/utils/presentation_utils/snack_bar.dart';
// import 'package:flutter/material.dart';

// // ignore: depend_on_referenced_packages
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';

// class DownloadableFileWidget extends StatefulWidget {
//   final String filePathFromApi; // مثال: "attachments/image.jpg"

//   const DownloadableFileWidget({super.key, required this.filePathFromApi});

//   @override
//   State<DownloadableFileWidget> createState() => _DownloadableFileWidgetState();
// }

// class _DownloadableFileWidgetState extends State<DownloadableFileWidget> {
//   late String _fullUrl;
//   late String _localPath;
//   bool _isDownloaded = false;
//   bool _isDownloading = false;

//   @override
//   void initState() {
//     super.initState();
//     _preparePaths();
//   }

//   Future<void> _preparePaths() async {
//     final dir = await getApplicationDocumentsDirectory();
//     final fileName = widget.filePathFromApi.split('/').last;
//     _localPath = '${dir.path}/$fileName';
//     _fullUrl = widget.filePathFromApi; // غيّر الدومين

//     final file = File(_localPath);
//     final exists = await file.exists();

//     setState(() {
//       _isDownloaded = exists;
//     });
//   }

//   Future<void> _downloadFile() async {
//     setState(() => _isDownloading = true);

//     try {
//       Response _ = await getIt<ApiServices>().download(
//         baseUrl: _fullUrl,
//         savePath: _localPath,
//       );
//       setState(() {
//         _isDownloaded = true;
//         _isDownloading = false;
//       });
//     } catch (e) {
//       log('فشل التحميل: $e');

//       setState(() {
//         _isDownloaded = false;
//         _isDownloading = false;
//       });
//       if (mounted) {
//         CustomSnackBar.showSnackBar(
//           context,
//           message: 'error',
//           type: AlertType.failed,
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: _isDownloading
//           ? const CustomLoadingWidget()
//           : GestureDetector(
//               onTap: () {
//                 if (_isDownloaded) {
//                   FileHelper.openFile(_localPath);
//                 } else if (_isDownloading) {
//                 } else {
//                   _downloadFile();
//                 }
//               },
//               child: Text(
//                 widget.filePathFromApi,
//                 style: context.textTheme.bodyLarge?.copyWith(
//                   color: context.colorScheme.blueGreyColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//     );
//   }
// }
