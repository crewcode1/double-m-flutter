import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/live_sessions/domain/entities/live_session_entity.dart';
import 'package:doublem/features/live_sessions/domain/repositories/live_sessions_repository.dart';

class GetAllLiveSessionsUseCase {
  final LiveSessionsRepository repository;

  GetAllLiveSessionsUseCase({required this.repository});

  Future<Either<Failure, List<LiveSessionEntity>>> call({
    required int courseId,
  }) {
    return repository.getAllLiveSessions(courseId: courseId);
  }
}
