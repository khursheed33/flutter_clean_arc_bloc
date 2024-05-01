import 'package:flutter_clean_arc_bloc/index.dart';

/// Authentication Screen with Form and validation
class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: AppTitle("Authentication"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutePaths.root,
              );
            },
            child: const AppTitle(
              "Log out",
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          AppElevatedButton(
            onPressed: () {},
            title: "Dark Theme",
          )
        ],
      ),
    );
  }
}
