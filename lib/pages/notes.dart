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

  void addNote(String title, String content) {
    setState(() {
      storage.notes.add([title, content]);
    });
    storage.updateNotes();
  }

  void editNote(int index, String title, String content) {
    setState(() {
      storage.notes[index] = [title, content];
    });
    storage.updateNotes();
  }

  void deleteNote(int index) {
    setState(() {
      storage.notes.removeAt(index);
    });
    storage.updateNotes();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: scheme.background,
      drawer: const Menu(),
      appBar: AppBar(
        backgroundColor: scheme.secondary,
        title: Text("Notes", style: TextStyle(color: scheme.onSecondary)),
        centerTitle: true,
        elevation: 10,
        shadowColor: scheme.shadow,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }, 
              icon: Icon(Icons.menu, color: scheme.onSecondary)
            );
          },
        ),
      ),
      body: storage.notes.isNotEmpty ? Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: storage.notes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => EditNote(index: index, edit_note: editNote, delete_note: deleteNote)
                ));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(storage.notes[index][0],
                      style: TextStyle(
                        color: scheme.onPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                      )
                    ),
                    Text(storage.notes[index][1],
                      maxLines: 7,
                      style: TextStyle(
                        color: scheme.onPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      )
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ) : Center(
        child: Text("You don't have any notes yet.",
          style: TextStyle(
            color: scheme.onBackground,
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => NewNote(add_note: addNote)
                ));
              });
            },
            tooltip: "Create a new note",
            child: Icon(Icons.add, color: scheme.primary)
          );
        }
      )
    );
  }
}

class NewNote extends StatefulWidget {
  final Function(String, String) add_note;

  const NewNote({super.key, required this.add_note});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  void saveNewNote(String title, String content) {
    widget.add_note(title, content);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    title.text = "New Note";

    return Scaffold(
      backgroundColor: scheme.background,
      appBar: AppBar(
        backgroundColor: scheme.secondary,
        title: Transform.translate(
          offset: const Offset(0, -3),
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 20,
            style: TextStyle(
              color: scheme.onSecondary,
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
        shadowColor: scheme.shadow,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: scheme.onSecondary),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              saveNewNote(title.text, content.text);
            },
            icon: Icon(Icons.check, color: scheme.onSecondary)
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          style: TextStyle(
            color: scheme.onBackground
          ),
          maxLines: null,
          controller: content,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: "Type here...",
            hintStyle: TextStyle(color: scheme.onTertiary, fontWeight: FontWeight.w300),
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}

class EditNote extends StatefulWidget {
  final int index;
  final Function(int, String, String) edit_note;
  final Function(int) delete_note;

  const EditNote({super.key, required this.index, required this.edit_note, required this.delete_note});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  Storage storage = Storage();

  void saveEdittedNote(int index, String title, String content) {
    widget.edit_note(index, title, content);
    Navigator.of(context).pop();
  }

  void deleteNote(int index) {
    widget.delete_note(index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    storage.loadNotes();
    title.text = storage.notes[widget.index][0];
    content.text = storage.notes[widget.index][1];

    return Scaffold(
      backgroundColor: scheme.background,
      appBar: AppBar(
        backgroundColor: scheme.secondary,
        title: Transform.translate(
          offset: const Offset(20, -3),
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 20,
            style: TextStyle(
              color: scheme.onSecondary,
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
          icon: Icon(Icons.arrow_back_ios, color: scheme.onSecondary),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              deleteNote(widget.index);
            },
            icon: Icon(Icons.delete, color: scheme.onSecondary)
          ),
          IconButton(
            onPressed: () {
              saveEdittedNote(widget.index, title.text, content.text);
            },
            icon: Icon(Icons.check, color: scheme.onSecondary)
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          style: TextStyle(
            color: scheme.onBackground
          ),
          maxLines: null,
          controller: content,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: "Type here...",
            hintStyle: TextStyle(color: scheme.onTertiary, fontWeight: FontWeight.w300),
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}