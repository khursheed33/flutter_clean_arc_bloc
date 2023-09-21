import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_title.dart';
import '../../widgets/authentication/login.dart';

import 'package:flutter/material.dart';

/// Authentication Screen with Form and validation
class CCAuthenticationScreen extends StatelessWidget {
  const CCAuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.movies,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.1),
              Image.asset(AppAssets.chalchitraLogo),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Container(
                height: 60,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  border: Border(
                    bottom: BorderSide(
                      width: 3,
                      color: AppColor.lightYellow,
                    ),
                  ),
                ),
                child: AppTitle(
                  "Log In",
                  color: AppColor.white,
                ),
              ),
              const SizedBox(height: 40),
              const CCLoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
