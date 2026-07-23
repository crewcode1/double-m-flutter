import 'package:doublem/features/live_sessions/domain/entities/live_session_entity.dart';

class LiveSessionModel {
  final int? id;
  final String? title;
  final String? description;
  final String? meetingUrl;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? courseId;
  final String? teacherId;
  final DateTime? sessionDate;
  final int? capacity;
  final bool? isCancelled;
  final int? bookedSeatsCount;
  final DateTime? createdAt;

  LiveSessionModel({
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

  factory LiveSessionModel.fromJson(Map<String, dynamic> json) {
    final sessionDateStr = json['sessionDate']?.toString();
    final startTimeStr = json['startTime']?.toString();
    final endTimeStr = json['endTime']?.toString();

    DateTime? combineDateAndTime(String? date, String? time) {
      if (date == null || time == null) return null;
      final dateOnly = date.split('T')[0];
      return DateTime.parse('${dateOnly}T$time');
    }

    return LiveSessionModel(
      id: json['id'] as int?,
      title: json['title']?.toString(),
      description: json['description']?.toString(),
      meetingUrl: json['meetingLink']?.toString(),
      startTime: combineDateAndTime(sessionDateStr, startTimeStr),
      endTime: combineDateAndTime(sessionDateStr, endTimeStr),
      courseId: json['courseId'] as int?,
      teacherId: json['teacherId']?.toString(),
      sessionDate: sessionDateStr != null
          ? DateTime.parse(sessionDateStr.split('T')[0])
          : null,
      capacity: json['capacity'] as int?,
      isCancelled: json['isCancelled'] as bool?,
      bookedSeatsCount: json['bookedSeatsCount'] as int?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'].toString())
          : null,
    );
  }

  LiveSessionEntity toEntity() {
    return LiveSessionEntity(
      id: id ?? 0,
      title: title ?? 'Live Session',
      description: description ?? 'No description available',
      meetingUrl: meetingUrl ?? '',
      startTime: startTime ?? DateTime.now(),
      endTime: endTime ?? DateTime.now(),
      courseId: courseId ?? 0,
      teacherId: teacherId ?? '',
      sessionDate: sessionDate ?? DateTime.now(),
      capacity: capacity ?? 0,
      isCancelled: isCancelled ?? false,
      bookedSeatsCount: bookedSeatsCount ?? 0,
      createdAt: createdAt ?? DateTime.now(),
    );
  }
}
