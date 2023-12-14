// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/pages/notes.dart';
import 'package:notes/pages/settings.dart';
import 'package:notes/pages/tasks.dart';
import 'package:notes/util/storage.dart';
import 'package:notes/util/themes.dart';
import 'package:provider/provider.dart';

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
  final GlobalKey<_AppState> key = GlobalKey<_AppState>();
  Storage storage = Storage();

  @override
  void initState() {
    if(storage.storage.get("theme") == null) storage.updateTheme();
    else storage.loadTheme();
    super.initState();

    Future.delayed(Duration.zero, () {
      Provider.of<ThemeManager>(key.currentContext!, listen: false).changeTheme(storage.theme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (contex, theme_manager, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const Notes(),
            theme: theme_manager.theme,
            routes: {
              "/notes": (context) => const Notes(),
              "/tasks": (context) => const Tasks(),
              "/settings":(context) => const Settings(),
            },
          );
        }
      ),
    );
  }
}