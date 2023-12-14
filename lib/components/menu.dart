import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
        color: scheme.primary,
        width: 300,
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.notes, color: scheme.onPrimary, size: 70)
            ),
            Builder(
              builder: (context) {
                return ListTile(
                  leading: Icon(Icons.notes, color: scheme.onPrimary),
                  title: Text("Notes", style: TextStyle(color: scheme.onPrimary)),
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
                  leading: Icon(Icons.task_alt, color: scheme.onPrimary),
                  title: Text("Tasks", style: TextStyle(color: scheme.onPrimary)),
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
                    leading: Icon(Icons.settings, color: scheme.onPrimary),
                    title: Text("Settings", style: TextStyle(color: scheme.onPrimary)),
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