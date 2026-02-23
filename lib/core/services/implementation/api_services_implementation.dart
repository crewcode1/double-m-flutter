import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';

class DioApiServices extends ApiServices {
  final Dio _dio;
  // String serviceKeyValue;
  String baseURL;

  DioApiServices({
    // required this.serviceKeyValue,
    required this.baseURL,
  }) : _dio =
           Dio(
               BaseOptions(
                 baseUrl: baseURL,
                 receiveDataWhenStatusError: true,
                 connectTimeout: const Duration(seconds: 10),
                 receiveTimeout: const Duration(seconds: 10),
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
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await _dio.get(
      baseUrl == null ? endPoint : baseUrl + endPoint,
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
    String? baseUrl,
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
      endPoint == null ? baseUrl ?? baseURL : baseUrl ?? baseURL + endPoint,
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
    String? baseUrl,
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
      baseUrl == null ? endPoint : baseUrl + endPoint,
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
    String? baseUrl,
    required String endPoint,
    data,
    query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await _dio.delete(
      baseUrl == null ? endPoint : baseUrl + endPoint,
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
    String? baseUrl,
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
      baseUrl == null ? endPoint : baseUrl + endPoint,
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
    required String baseUrl,
    required String? savePath,
  }) async {
    final Response response = await _dio.download(baseUrl, savePath);
    return response;
  }

  @override
  Future<Uint8List> loadPdf({required String fileUrl}) async {
    String? userToken = CacheUtils().getString(key: 'userToken');
    final Response response = await _dio.get(
      fileUrl,
      options: Options(
        responseType: ResponseType.bytes,
        headers: {'authorization': 'Bearer $userToken'},
      ),
    );
    return Uint8List.fromList(response.data);
  }
}
