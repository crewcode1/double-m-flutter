class NotificationEntity {
  final int id;
  final String title;
  final String message;
  final DateTime createdAt;
  final String? courseName;
  final String? videoName;
  final String? pdfUrl;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    this.courseName,
    this.videoName,
    this.pdfUrl,
  });
}
