import 'package:flutter_clean_arc_bloc/features/domain/entities/verify_otp_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_model.g.dart';

@JsonSerializable()
class VerifyOTPModel extends VerifyOTPEntity {
  const VerifyOTPModel({
    required super.status,
    required super.detail,
    required super.data,
  });

  factory VerifyOTPModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOTPModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOTPModelToJson(this);
}
