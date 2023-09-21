import 'package:equatable/equatable.dart';

class VerifyOTPEntity extends Equatable {
  final bool status;
  final Object detail;
  final Object data;

  const VerifyOTPEntity({
    required this.status,
    required this.detail,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        detail,
        data,
      ];
}
