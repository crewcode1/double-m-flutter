abstract class LiveSessionsEvent {}

class LoadAllLiveSessionsEvent extends LiveSessionsEvent {
  final int courseId;

  LoadAllLiveSessionsEvent({required this.courseId});
}

class JoinLiveSessionRequestEvent extends LiveSessionsEvent {
  final int sessionId;

  JoinLiveSessionRequestEvent({required this.sessionId});
}
