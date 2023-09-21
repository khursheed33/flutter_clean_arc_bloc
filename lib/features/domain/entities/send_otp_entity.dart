import 'package:equatable/equatable.dart';

class SendOTPEntity extends Equatable {
  final bool status;
  final Object detail;
  final bool userExists;

  const SendOTPEntity({
    required this.status,
    required this.detail,
    required this.userExists,
  });

  @override
  List<Object?> get props => [
        status,
        detail,
        userExists,
      ];
}
