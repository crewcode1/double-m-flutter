import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:dio/dio.dart';

class NetworkFailureModel extends Failure {
  NetworkFailureModel({required super.errorMessage});

  factory NetworkFailureModel.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailureModel(errorMessage: 'connectionTimeOut');
      case DioExceptionType.sendTimeout:
        return NetworkFailureModel(errorMessage: 'sendTimeOut');

      case DioExceptionType.receiveTimeout:
        return NetworkFailureModel(errorMessage: 'recieveTimeOut');

      case DioExceptionType.badCertificate:
        return NetworkFailureModel(errorMessage: 'badCertificate');

      case DioExceptionType.badResponse:
        return NetworkFailureModel(
          errorMessage: _extractErrorMessage(error.response?.data),
        );

      case DioExceptionType.cancel:
        return NetworkFailureModel(errorMessage: 'requestCancelled');

      case DioExceptionType.connectionError:
        return NetworkFailureModel(errorMessage: 'noInternetConnection');

      case DioExceptionType.unknown:
        return NetworkFailureModel(errorMessage: 'ops');
    }
  }

  factory NetworkFailureModel.fromResponse({required int statusCode}) {
    if (statusCode == 404) {
      return NetworkFailureModel(errorMessage: 'serverNotFound');
    }
    if (statusCode == 500) {
      return NetworkFailureModel(errorMessage: 'serverNotFound');
    }
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return NetworkFailureModel(errorMessage: 'serverNotFound');
    }
    return NetworkFailureModel(errorMessage: 'error');
  }

  static String _extractErrorMessage(dynamic data) {
    if (data is String && data.trim().isNotEmpty) {
      return data;
    }

    if (data is Map) {
      final map = data.map((key, value) => MapEntry(key.toString(), value));

      final errors = map['errors'];
      if (errors is Map) {
        for (final value in errors.values) {
          if (value is String && value.trim().isNotEmpty) {
            return value;
          }
          if (value is List) {
            for (final item in value) {
              if (item is String && item.trim().isNotEmpty) {
                return item;
              }
            }
          }
        }
      }

      final message = map['message'];
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }

      final title = map['title'];
      if (title is String && title.trim().isNotEmpty) {
        return title;
      }

      final error = map['error'];
      if (error is String && error.trim().isNotEmpty) {
        return error;
      }

      return map.toString();
    }

    return 'ops';
  }
}
