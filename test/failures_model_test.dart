import 'package:dio/dio.dart';
import 'package:doublem/core/models/errors/failures_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NetworkFailureModel.fromDioError', () {
    test('returns a readable message when the API returns an errors object', () {
      final error = DioException.badResponse(
        statusCode: 400,
        requestOptions: RequestOptions(path: '/login'),
        response: Response(
          requestOptions: RequestOptions(path: '/login'),
          statusCode: 400,
          data: {
            'type': 'https://tools.ietf.org/html/rfc9110#section-15.5.1',
            'title': 'One or more validation errors occurred.',
            'status': 400,
            'errors': {
              'Password': [
                'The field Password must be a string with a minimum length of 6 and a maximum length of 100.',
              ],
            },
            'traceId': 'trace-id',
          },
        ),
      );

      final failure = NetworkFailureModel.fromDioError(error);

      expect(failure.errorMessage, contains('minimum length of 6'));
    });
  });
}
