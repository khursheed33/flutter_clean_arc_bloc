import 'package:flutter/material.dart';

import '../../../../core/enums/view_state.dart';
import '../../../../core/extensions/message_log.dart';
import '../../../../core/widgets/custom_loader.dart';
import '../../base/base_view_model.dart';
import '../../providers/auth_view_model.dart';
import '../authentication/authenitication_screen.dart';

class CCSplashScreen extends StatelessWidget {
  const CCSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<AuthViewModel>(
        onModelReady: (model) async {
          await model.isTokenExists();
        },
        onModelDispose: (model) {
          model.disposeModel();
        },
        builder: (context, model, _) {
          return Center(
            child: StreamBuilder<String?>(
              stream: model.userStream,
              builder: (ctx, data) {
                "Stream:: ${data.connectionState} | ${data.data}".log();
                if (data.data != null) {
                  // WidgetsBinding.instance.addPostFrameCallback(
                  //   (_) => Navigator.pushReplacementNamed(
                  //     context,
                  //     AppRoutePaths.authentication,
                  //   ),
                  // );
                  if (data.connectionState == ConnectionState.waiting) {
                    return const AppCircularProgress();
                  }
                  return const CCAuthenticationScreen();
                } else {
                  if (model.token != null) {
                    return const CCAuthenticationScreen();
                  }
                  return model.state == ViewState.Loading
                      ? const AppCircularProgress()
                      : const CCAuthenticationScreen();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
