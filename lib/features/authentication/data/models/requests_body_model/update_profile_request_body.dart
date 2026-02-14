import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request_body.g.dart';

@JsonSerializable(createToJson: true)
class UpdateProileRequestBody {
  final String email;
  final String fullName;
  final String phoneNumber;
  UpdateProileRequestBody({
    required this.email,
    required this.fullName,
    required this.phoneNumber,
  });
  Map<String, dynamic> toJson() => _$UpdateProileRequestBodyToJson(this);
}
