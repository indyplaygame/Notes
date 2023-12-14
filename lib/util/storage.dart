import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  final Box storage = Hive.box("storage");
  List tasks = [];
  List notes = [];

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
}