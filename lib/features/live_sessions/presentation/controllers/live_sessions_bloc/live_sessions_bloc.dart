import 'package:doublem/core/models/either/either.dart';
import 'package:doublem/core/models/errors/failure_model.dart';
import 'package:doublem/features/live_sessions/domain/use_cases/get_all_live_sessions_use_case.dart';
import 'package:doublem/features/live_sessions/domain/use_cases/join_live_session_use_case.dart';
import 'package:doublem/features/live_sessions/presentation/controllers/live_sessions_bloc/live_sessions_event.dart';
import 'package:doublem/features/live_sessions/presentation/controllers/live_sessions_bloc/live_sessions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveSessionsBloc extends Bloc<LiveSessionsEvent, LiveSessionsState> {
  final GetAllLiveSessionsUseCase getAllLiveSessionsUseCase;
  final JoinLiveSessionUseCase joinLiveSessionUseCase;

  LiveSessionsBloc({
    required this.getAllLiveSessionsUseCase,
    required this.joinLiveSessionUseCase,
  }) : super(LiveSessionsInitial()) {
    on<LoadAllLiveSessionsEvent>(_onLoadAllLiveSessions);
    on<JoinLiveSessionRequestEvent>(_onJoinLiveSession);
  }

  Future<void> _onLoadAllLiveSessions(
    LoadAllLiveSessionsEvent event,
    Emitter<LiveSessionsState> emit,
  ) async {
    emit(LiveSessionsLoading());

    final result = await getAllLiveSessionsUseCase(courseId: event.courseId);

    result.fold(
      (failure) => emit(LiveSessionsError(message: failure.errorMessage)),
      (sessions) => emit(LiveSessionsLoaded(sessions: sessions)),
    );
  }

  Future<void> _onJoinLiveSession(
    JoinLiveSessionRequestEvent event,
    Emitter<LiveSessionsState> emit,
  ) async {
    emit(LiveSessionJoinLoading());

    final Either<Failure, void> result = await joinLiveSessionUseCase(
      sessionId: event.sessionId,
    );

    result.fold(
      (failure) => emit(LiveSessionJoinError(message: failure.errorMessage)),
      (_) => emit(LiveSessionJoined()),
    );
  }
}
