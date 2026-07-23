import 'package:doublem/features/live_sessions/domain/entities/live_session_entity.dart';

abstract class LiveSessionsState {}

class LiveSessionsInitial extends LiveSessionsState {}

class LiveSessionsLoading extends LiveSessionsState {}

class LiveSessionsLoaded extends LiveSessionsState {
  final List<LiveSessionEntity> sessions;

  LiveSessionsLoaded({required this.sessions});
}

class LiveSessionsError extends LiveSessionsState {
  final String message;

  LiveSessionsError({required this.message});
}

class LiveSessionJoined extends LiveSessionsState {}

class LiveSessionJoinError extends LiveSessionsState {
  final String message;

  LiveSessionJoinError({required this.message});
}

class LiveSessionJoinLoading extends LiveSessionsState {}
