// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOTPModel _$VerifyOTPModelFromJson(Map<String, dynamic> json) =>
    VerifyOTPModel(
      status: json['status'] as bool,
      detail: json['detail'] as Object,
      data: json['data'] as Object,
    );

Map<String, dynamic> _$VerifyOTPModelToJson(VerifyOTPModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'detail': instance.detail,
      'data': instance.data,
    };
