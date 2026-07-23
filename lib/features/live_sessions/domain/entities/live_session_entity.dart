import 'package:equatable/equatable.dart';

class LiveSessionEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String meetingUrl;
  final DateTime startTime;
  final DateTime endTime;
  final int courseId;
  final String teacherId;
  final DateTime sessionDate;
  final int capacity;
  final bool isCancelled;
  final int bookedSeatsCount;
  final DateTime createdAt;

  const LiveSessionEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.meetingUrl,
    required this.startTime,
    required this.endTime,
    required this.courseId,
    required this.teacherId,
    required this.sessionDate,
    required this.capacity,
    required this.isCancelled,
    required this.bookedSeatsCount,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title];
}
