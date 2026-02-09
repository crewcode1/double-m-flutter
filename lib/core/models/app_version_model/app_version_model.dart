class AppVersionModel {
  final String version;
  final int buildNumber;
  AppVersionModel({required this.version, required this.buildNumber});
  factory AppVersionModel.fromJson({
    required Map<String, dynamic> json,
    required String platform,
  }) {
    return AppVersionModel(
      version: json[platform]['version'],
      buildNumber: json[platform]['buildNumber'],
    );
  }
}
