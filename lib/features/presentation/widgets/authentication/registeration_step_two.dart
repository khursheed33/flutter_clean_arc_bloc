import '../../base/base_view_model.dart';
import 'package:flutter/material.dart';

class CCRegisterationStepTwo extends StatelessWidget {
  final String mobile;
  final String otp;
  final String fullName;
  const CCRegisterationStepTwo({
    super.key,
    required this.mobile,
    required this.otp,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, model, _) {
        return Column(
          children: [
            Container(),
          ],
        );
      },
    );
  }
}
