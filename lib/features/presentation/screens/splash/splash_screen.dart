import 'package:flutter_clean_arc_bloc/core/constants/app_colors.dart';
import 'package:flutter_clean_arc_bloc/index.dart';

class SplashScreen extends StatelessWidget {
  final String? message;
  const SplashScreen({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppIcon.logo),
                ),
              ),
            ),
            AppTitle(
              message ?? "Splash...",
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
