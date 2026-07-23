import 'package:dio/dio.dart';
import 'package:doublem/core/constants_strings/end_points.dart';
import 'package:doublem/core/services/abstraction/api_services.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:doublem/features/live_sessions/data/models/live_session_model.dart';

abstract class LiveSessionsRemoteDataSource {
  Future<List<LiveSessionModel>> getAllLiveSessions({required int courseId});
  Future<void> joinLiveSession({required int sessionId});
}

class LiveSessionsRemoteDataSourceImpl implements LiveSessionsRemoteDataSource {
  final ApiServices apiServices;

  LiveSessionsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<LiveSessionModel>> getAllLiveSessions({
    required int courseId,
  }) async {
    final String? userToken = CacheUtils().getString(key: 'userToken');
    final String? deviceToken = CacheUtils().getString(key: 'deviceToken');
    final Response response = await apiServices.get(
      endPoint: '${EndPoints.liveSessions}/${EndPoints.courses}/$courseId',
      token: userToken,
      deviceToken: deviceToken,
    );

    final dynamic rawData = response.data['data'];
    final List<dynamic> items = rawData is List
        ? rawData
        : (rawData['items'] as List<dynamic>? ?? []);

    return items
        .map((item) => LiveSessionModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> joinLiveSession({required int sessionId}) async {
    final String? userToken = CacheUtils().getString(key: 'userToken');
    final String? deviceToken = CacheUtils().getString(key: 'deviceToken');
    final Response response = await apiServices.post(
      endPoint: '${EndPoints.liveSessions}/book',
      token: userToken,
      deviceToken: deviceToken,
      data: {'extraSessionId': sessionId},
    );

    return response.data;
  }
}
