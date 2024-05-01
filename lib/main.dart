import 'package:flutter_clean_arc_bloc/index.dart';

/// The main function initializes dependencies, starts the app, and logs any errors that occur.
Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Dependency Injection
    await initializeDependencies();
    // Start App
    runApp(const AppFoundation());
  }, (error, stackTrace) {
    // Log error
    "Error: $error \n$stackTrace".log();
  });
}
