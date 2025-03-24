import 'package:flutter/material.dart'; // Import the material package
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:src/core/route/app_router.dart';
import 'package:src/pages/homePage/home_page.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: '',
    anonKey:
        '',
  )

  runApp(MyApp());
}

final supabaseClient = Supabase.instance.client;

class MyApp extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      routerConfig: _appRouter.config(),
      title: "Test",
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
    );
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }
}
