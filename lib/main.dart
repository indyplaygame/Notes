import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/pages/notes.dart';
import 'package:notes/pages/settings.dart';
import 'package:notes/pages/tasks.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Notes(),
      routes: {
        "/notes": (context) => const Notes(),
        "/notes/new_note": (context) => const NewNote(),
        "/tasks": (context) => const Tasks(),
        "/settings":(context) => const Settings(),
      },
    );
  }
}