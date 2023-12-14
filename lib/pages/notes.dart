// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:notes/components/menu.dart';
import 'package:notes/util/storage.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  Storage storage = Storage();

  @override
  void initState() {
    if(storage.storage.get("notes") == null) storage.updateNotes();
    else storage.loadNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      drawer: const Menu(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text("Notes", style: TextStyle(color: Colors.white)),
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
        ),
      ),
      body: storage.notes.isNotEmpty ? ListView(

      ) : const Center(
        child: Text("You don't have any notes yet.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          )
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              setState(() {
                Scaffold.of(context).closeDrawer();
                Navigator.pushNamed(context, "/notes/new_note");
              });
            },
            tooltip: "Create a new note",
            child: Icon(Icons.add, color: Colors.deepPurple[300])
          );
        }
      )
    );
  }
}

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.text = "New Note";

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Transform.translate(
          offset: const Offset(0, -3),
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 30,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
            controller: title,
            decoration: const InputDecoration(
              hintText: "Enter a title for your note",
              hintStyle: TextStyle(color: Colors.white24),
              border: InputBorder.none,
              counterText: ''
            ),
          ),
        ),
        elevation: 10,
        shadowColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(Icons.save, color: Colors.white)
          )
        ],
      )
    );
  }
}