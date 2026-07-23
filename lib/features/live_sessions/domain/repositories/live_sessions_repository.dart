import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/live_sessions/domain/entities/live_session_entity.dart';

abstract class LiveSessionsRepository {
  Future<Either<Failure, List<LiveSessionEntity>>> getAllLiveSessions({
    required int courseId,
  });
  Future<Either<Failure, void>> joinLiveSession({required int sessionId});
}
