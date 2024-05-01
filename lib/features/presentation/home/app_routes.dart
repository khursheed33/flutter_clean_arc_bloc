import 'package:go_router/go_router.dart';

import '../../../index.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutePaths.root,
        pageBuilder: (context, state) {
          return const MaterialPage(
              child: SplashScreen(
            message: "Root...",
          ));
        },
      ),
      GoRoute(
        path: '/splash',
        name: AppRoutePaths.splash,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        path: '/registration',
        name: AppRoutePaths.authentication,
        pageBuilder: (context, state) {
          return const MaterialPage(
              child: SplashScreen(
            message: "Registration",
          ));
        },
      ),
    ],
  );
}
