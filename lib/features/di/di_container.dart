import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_clean_arc_bloc/index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GetIt locator = GetIt.instance;

Future<void> initHiveDB() async {
  // Initialize Hive
  if (kIsWeb) {
    "Platform: Web".log();
    await Hive.initFlutter();
    await Hive.openBox(HiveCollections.localDB);
  } else {
    if (Platform.isAndroid ||
        Platform.isIOS ||
        Platform.isMacOS ||
        Platform.isWindows) {
      final appDocumentDirectory = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDirectory.path);
    } else if (Platform.isFuchsia || Platform.isLinux) {
      Hive.init('.');
    }
    await Hive.openBox(HiveCollections.localDB);
  }
}

Future<void> initializeDependencies() async {
  // Initializations::::::::::::::::::::::::::::::::::::
  await initHiveDB();
  // Open the Hive box
  // ------------------------------------------------------
  // ::::::: VIEWMODELS/PROVIDERS/CONTROLLERS :::::::::::::
  DiViewModels(locator: locator);
  //:::::::::::::::: USECASES :::::::::::::::::::::::::::::
  DiUsecases(locator: locator);
  //::::::::::::::: DATA SOURCES ::::::::::::::::::::::::::
  DiDatasources(locator: locator);
  //:::::::::::::::  REPOSITORIES :::::::::::::::::::::::::
  DiRepositories(locator: locator);
  // :::::::: EXTERNAL DATA SOURCES/ DEPENDENCIES :::::::::
  final Dio dio = Dio();
  final Connectivity connectivity = Connectivity();
  final Box hiveBox = Hive.box(HiveCollections.localDB);
  final AwesomeNotifications notification = AwesomeNotifications();

  locator.registerLazySingleton<Dio>(() => dio);
  locator.registerLazySingleton<Box>(() => hiveBox);
  locator.registerLazySingleton<Connectivity>(() => connectivity);
  locator.registerLazySingleton<AwesomeNotifications>(() => notification);
}
