import 'package:dio/dio.dart';
import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/core/models/errors/failures_model.dart';
import 'package:doublem/features/live_sessions/data/data_source/live_sessions_remote_data_source.dart';
import 'package:doublem/features/live_sessions/domain/entities/live_session_entity.dart';
import 'package:doublem/features/live_sessions/domain/repositories/live_sessions_repository.dart';

class LiveSessionsRepositoryImpl implements LiveSessionsRepository {
  final LiveSessionsRemoteDataSource remoteDataSource;

  LiveSessionsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<LiveSessionEntity>>> getAllLiveSessions({
    required int courseId,
  }) async {
    try {
      final sessions = await remoteDataSource.getAllLiveSessions(
        courseId: courseId,
      );
      return Either.succeed(sessions.map((model) => model.toEntity()).toList());
    } catch (e) {
      print('live sessions exception :$e');
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      }
      return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> joinLiveSession({
    required int sessionId,
  }) async {
    try {
      await remoteDataSource.joinLiveSession(sessionId: sessionId);
      return Either.succeed(null);
    } catch (e) {
      if (e is DioException) {
        return Either.failed(NetworkFailureModel.fromDioError(e));
      }
      return Either.failed(NetworkFailureModel(errorMessage: e.toString()));
    }
  }
}
