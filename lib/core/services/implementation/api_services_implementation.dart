import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';

class DioApiServices extends ApiServices {
  final Dio _dio;
  // String serviceKeyValue;
  String baseUrl;

  DioApiServices({
    // required this.serviceKeyValue,
    required this.baseUrl,
  }) : _dio =
           Dio(
               BaseOptions(
                 baseUrl: baseUrl,
                 receiveDataWhenStatusError: true,
                 connectTimeout: const Duration(seconds: 50),
                 receiveTimeout: const Duration(seconds: 50),
               ),
             )
             ..interceptors.add(
               LogInterceptor(
                 requestBody: true,
                 error: true,
                 requestHeader: true,
                 responseHeader: false,
                 request: true,
                 responseBody: true,
                 logPrint: (object) => log(object.toString()),
               ),
             ) {
    _dio.httpClientAdapter = IOHttpClientAdapter()
      ..createHttpClient = () {
        // Create a new HttpClient instance
        final HttpClient client = HttpClient();
        // Bypass certificate verification (for development only!)
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
  }

  @override
  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await _dio.get(
      base == null ? endPoint : base + endPoint,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          // 'ServiceKey': serviceKeyValue,
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (token != null) 'authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future<dynamic> post({
    String? base,
    String? endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.post(
      endPoint == null ? base ?? baseUrl : base ?? baseUrl + endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
      options: Options(
        headers:
            headers ??
            {
              // 'ServiceKey': serviceKeyValue,
              if (isMultipart) 'Content-Type': 'multipart/form-data',
              if (!isMultipart) 'Content-Type': 'application/json',
              if (!isMultipart) 'Accept': 'application/json',
              if (!isMultipart) 'X-Requested-With': 'XMLHttpRequest',
              if (token != null) 'authorization': 'Bearer $token',
            },
      ),
    );
  }

  @override
  Future patch({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await _dio.patch(
      base == null ? endPoint : base + endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          // 'ServiceKey': serviceKeyValue,
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (token != null) 'authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future delete({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await _dio.delete(
      base == null ? endPoint : base + endPoint,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          // 'ServiceKey': serviceKeyValue,
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (token != null) 'authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future put({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await _dio.put(
      base == null ? endPoint : base + endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          // 'ServiceKey': serviceKeyValue,
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (token != null) 'authorization': 'Bearer $token',
        },
      ),
    );
  }

  @override
  Future<Response> download({
    required String url,
    required String? savePath,
  }) async {
    final Response response = await _dio.download(
      url,
      savePath,
      // options: Options(

      //   headers: {'ServiceKey': serviceKeyValue}),
    );
    return response;
  }
}
