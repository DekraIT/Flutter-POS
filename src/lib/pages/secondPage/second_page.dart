import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart'; // Import the material package
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:src/main.dart';
import 'package:src/pages/placeholderPage/placeholder_page.dart';
import 'package:src/widgets/items_container.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart'; // Assuming this is a valid package in your project

@RoutePage()
class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SecondPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SecondPage> {
  int _counter = 0;

  void _navigateBack() {
    context.router.back();
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  Future<void> _signOut() async {
    try {
      await supabaseClient.auth.signOut();
    } on AuthException catch (error) {
      if (mounted) context.showSnackBar(error.message, isError: true);
    } catch (error) {
      if (mounted) {
        context.showSnackBar('Unexpected error occurred', isError: true);
      }
    } finally {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const PlaceholderPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: ShadTheme.of(context).textTheme.h2,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const ItemsContainer(),
            const Text(
              'You have pushed the button this many times on the second page:',
            ),
            Text(
              '$_counter',
              style: ShadTheme.of(context).textTheme.h1,
            ),
          ],
        )),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: ShadButton.destructive(
                onPressed: _signOut,
                child: const Text('Log out'),
              )),
              Expanded(
                  child: ShadButton(
                onPressed: _navigateBack,
                child: const Text('Back'),
              ))
            ],
          ),
        ));
  }
}
