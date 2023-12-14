import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/util/themes.dart';

class Storage {
  final Box storage = Hive.box("storage");
  List tasks = [];
  List notes = [];
  ThemeData theme = Themes.purple;

  void loadTasks() {
    tasks = storage.get("tasks");
  }

  void updateTasks() {
    storage.put("tasks", tasks);
  }

  void loadNotes() {
    notes = storage.get("notes");
  }

  void updateNotes() {
    storage.put("notes", notes);
  }

  void loadTheme() {
    theme = storage.get("theme");
  }

  void updateTheme() {
    storage.put("theme", theme);
  }
}