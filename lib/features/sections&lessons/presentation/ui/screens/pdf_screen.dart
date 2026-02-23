import 'dart:typed_data';
import 'package:doublem/core/extensions/screen_size.dart';
import 'package:doublem/core/injection/injection.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SecurePdfScreen extends StatefulWidget {
  final String pdfUrl;

  const SecurePdfScreen({super.key, required this.pdfUrl});

  @override
  State<SecurePdfScreen> createState() => _SecurePdfScreenState();
}

class _SecurePdfScreenState extends State<SecurePdfScreen> {
  Uint8List? pdfBytes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    final Uint8List response = await getIt<ApiServices>().loadPdf(
      fileUrl: widget.pdfUrl,
    );
    setState(() {
      pdfBytes = response;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    pdfBytes = null; // يمسح من الذاكرة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430.h,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(height: 400.h, child: SfPdfViewer.memory(pdfBytes!)),
    );
  }
}
