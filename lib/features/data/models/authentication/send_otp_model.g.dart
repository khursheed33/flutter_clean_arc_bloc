// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOTPModel _$SendOTPModelFromJson(Map<String, dynamic> json) => SendOTPModel(
      status: json['status'] as bool,
      detail: json['detail'] as Object,
      userExists: json['userExists'] as bool,
    );

Map<String, dynamic> _$SendOTPModelToJson(SendOTPModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'detail': instance.detail,
      'userExists': instance.userExists,
    };
