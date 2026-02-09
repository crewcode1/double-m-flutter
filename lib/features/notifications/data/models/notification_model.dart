// import 'package:doublem/features/course/data/models/course_model.dart';
// import 'package:doublem/features/videos/data/models/video_model.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'notification_model.g.dart';

// class NotificationModel with _$NotificationModel {
//   const factory NotificationModel({
//     required int id,
//     required String type,
//     required String title,
//     required String message,
//     @JsonKey(name: 'course_id') int? courseId,

//     @JsonKey() @JsonKey(name: 'video_id') int? videoId,
//     // NotificationExtraModel? data,
//     @JsonKey(name: 'created_at') required DateTime createdAt,
//     CourseModel? course,
//     VideoModel? video,
//   }) = _NotificationModel;

//   factory NotificationModel.fromJson(Map<String, dynamic> json) =>
//       _$NotificationModelFromJson(json);
// }
