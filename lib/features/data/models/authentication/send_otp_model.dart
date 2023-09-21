import 'package:flutter_clean_arc_bloc/features/domain/entities/send_otp_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_otp_model.g.dart';

@JsonSerializable()
class SendOTPModel extends SendOTPEntity {
  const SendOTPModel({
    required super.status,
    required super.detail,
    required super.userExists,
  });

  factory SendOTPModel.fromJson(Map<String, dynamic> json) =>
      _$SendOTPModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendOTPModelToJson(this);
}
