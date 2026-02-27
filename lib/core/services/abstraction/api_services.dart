import 'dart:typed_data';

import 'package:dio/dio.dart';

abstract class ApiServices {
  Future<dynamic> post({
    String? baseUrl,
    String? endPoint,
    dynamic data,
    dynamic query,
    String? token,
    String? deviceToken,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> patch({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    String? deviceToken,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> put({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    String? deviceToken,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> get({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    String? deviceToken,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
  Future<dynamic> download({required String baseUrl, required String savePath});
  Future<Uint8List> loadPdf({required String fileUrl});

  Future<dynamic> delete({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    String? deviceToken,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
}
