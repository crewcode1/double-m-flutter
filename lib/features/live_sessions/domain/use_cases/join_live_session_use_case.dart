import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/live_sessions/domain/repositories/live_sessions_repository.dart';

class JoinLiveSessionUseCase {
  final LiveSessionsRepository repository;

  JoinLiveSessionUseCase({required this.repository});

  Future<Either<Failure, void>> call({required int sessionId}) {
    return repository.joinLiveSession(sessionId: sessionId);
  }
}
