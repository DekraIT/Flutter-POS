import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart'; // Import the material package
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:src/core/route/app_router.gr.dart';
import 'package:src/widgets/items_container.dart'; // Assuming this is a valid package in your project

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _counter = 0;

  void _navigate() {
    // setState(() {
    //   _counter++;
    // });
    context.router.navigate(SecondRoute(title: "test2"));
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "test",
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
              'You have pushed the button this many times:',
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
                onPressed: _resetCounter,
                child: const Text('Zurücksetzen'),
              )),
              Expanded(
                  child: ShadButton(
                onPressed: _navigate,
                child: const Text('Quittieren'),
              ))
            ],
          ),
        ));
  }
}
