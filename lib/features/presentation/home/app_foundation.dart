import 'package:flutter_clean_arc_bloc/features/presentation/providers/preferences/app_preferences_bloc.dart';
import 'package:flutter_clean_arc_bloc/index.dart';

import '../../../core/env/app_environment.dart';

class AppFoundation extends StatelessWidget {
  const AppFoundation({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocs.appBlocs,
      child: BaseView<AppPreferencesBloc>(
        onInitial: (context, onInitial) {
          "State: onInitial-----".log();
          return MaterialApp.router(
            title: AppText.appName,
            // theme: AppTheme.lightTheme,
            // darkTheme: AppTheme.darkTheme,

            themeMode: ThemeMode.dark,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            debugShowCheckedModeBanner: EnvInfo.isProduction ? false : true,
          );
        },
        onLoading: (context, onLoading) {
          "State: onLoading-----".log();
          return MaterialApp.router(
            title: AppText.appName,
            // theme: AppTheme.lightTheme,
            // darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            debugShowCheckedModeBanner: EnvInfo.isProduction ? false : true,
          );
        },
        onError: (context, onError) {
          "State: onError-----".log();
          return MaterialApp.router(
            title: AppText.appName,
            // theme: AppTheme.lightTheme,
            // darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            debugShowCheckedModeBanner: EnvInfo.isProduction ? false : true,
          );
        },
        onData: (context, onData) {
          "State: onData-----".log();
          return MaterialApp.router(
            title: AppText.appName,
            // theme: AppTheme.lightTheme,
            // darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            debugShowCheckedModeBanner: EnvInfo.isProduction ? false : true,
          );
        },
      ),
    );
  }
}
