import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepPurple[300],
        width: 300,
        child: Column(
          children: [
            const DrawerHeader(
              child: Icon(Icons.notes, color: Colors.white, size: 70)
            ),
            Builder(
              builder: (context) {
                return ListTile(
                  leading: const Icon(Icons.notes, color: Colors.white),
                  title: const Text("Notes", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    setState(() {
                      Scaffold.of(context).closeDrawer();
                      Navigator.pushNamed(context, "/notes");
                    });
                  },
                );
              }
            ),
            Builder(
              builder: (context) {
                return ListTile(
                  leading: const Icon(Icons.task_alt, color: Colors.white),
                  title: const Text("Tasks", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    setState(() {
                      Scaffold.of(context).closeDrawer();
                      Navigator.pushNamed(context, "/tasks");
                    });
                  },
                );
              }
            ),
            Container(
              margin: const EdgeInsets.only(top: 470),
              child: Builder(
                builder: (context) {
                  return ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: const Text("Settings", style: TextStyle(color: Colors.white)),
                    onTap: () {
                      setState(() {
                        Scaffold.of(context).closeDrawer();
                        Navigator.pushNamed(context, "/settings");
                      });
                    },
                  );
                }
              ),
            ),
          ],
        ),
      );
  }
}