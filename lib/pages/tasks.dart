// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:notes/components/menu.dart';
import 'package:notes/components/task_tile.dart';
import 'package:notes/components/text_input.dart';
import 'package:notes/util/storage.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  Storage storage = Storage();

  @override
  void initState() {
    if(storage.storage.get("tasks") == null) storage.updateTasks();
    else storage.loadTasks();
    super.initState();
  }

  void createNewTask(context) {
    name.clear();
    description.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          content: Container(
            width: 300,
            height: 290,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Create a new task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextInput(label: "Task Name", hint: "Enter your task name", controller: name, limit: 20),
                TextInput(
                  label: "Task Description",
                  hint: "Enter your task description",
                  controller: description,
                  limit: 70
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 10, right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          saveNewTask(name.text, description.text);
                        },
                        child: const Text("Create task"),
                      ),
                    ),
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel")
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        );
      }
    );
  }

  void saveNewTask(String name, String description) {
    setState(() {
      storage.tasks.add([name, description, false]);
    });
    Navigator.of(context).pop();
    storage.updateTasks();
  }

  void deleteTask(int index) {
    setState(() {
      storage.tasks.removeAt(index);
    });
    storage.updateTasks();
  }

  void editTask(context, int index) {
    name.text = storage.tasks[index][0];
    description.text = storage.tasks[index][1];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          content: Container(
            width: 300,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Edit Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextInput(label: "New Task Name", hint: "Enter a new task name", controller: name, limit: 20),
                TextInput(
                  label: "New Task Description",
                  hint: "Enter a new task description",
                  controller: description,
                  limit: 70
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 20, right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          saveEdittedTask(name.text, description.text, index);
                        },
                        child: const Text("Save task"),
                      ),
                    ),
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel")
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        );
      }
    );
  }

  void saveEdittedTask(String name, String description, int index) {
    setState(() {
      storage.tasks[index] = [name, description, storage.tasks[index][2]];
      this.name.clear();
      this.description.clear();
    });
    Navigator.of(context).pop();
    storage.updateTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      drawer: const Menu(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text("Tasks", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }, 
              icon: const Icon(Icons.menu, color: Colors.white)
            );
          },
        )
      ),
      body: storage.tasks.isNotEmpty ? ListView.builder(
        itemCount: storage.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            task_name: storage.tasks[index][0],
            task_description: storage.tasks[index][1],
            completed: storage.tasks[index][2],
            on_change: (value) {
              setState(() {
                storage.tasks[index][2] = !storage.tasks[index][2];
              });
            },
            delete_function: (context) => deleteTask(index),
            edit_function: (context) => {editTask(context, index)},
          );
        },
      ) : const Center(
        child: Text("You don't have any tasks yet.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          )
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {createNewTask(context);},
            tooltip: "Create a new task",
            child: Icon(Icons.add, color: Colors.deepPurple[300])
          );
        }
      )
    );
  }
}