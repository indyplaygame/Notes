import 'package:flutter/material.dart';
import 'package:notes/pages/appearance.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: scheme.background,
      appBar: AppBar(
        backgroundColor: scheme.secondary,
        title: Text("Settings", style: TextStyle(color: scheme.onSecondary)),
        centerTitle: true,
        elevation: 10,
        shadowColor: scheme.shadow,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: scheme.onSecondary),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: scheme.onBackground,
          borderRadius: BorderRadius.circular(10)
        ),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: scheme.outline))
              ),
              child: ListTile(
                leading: Icon(Icons.palette_outlined, color: scheme.outline),
                title: Text("Appearance",
                  style: TextStyle(
                    color: scheme.outline
                  )
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const Appearance()
                  ));
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: scheme.outline))
              ),
              child: ListTile(
                leading: Icon(Icons.language, color: scheme.outline),
                title: Text("Language",
                  style: TextStyle(
                    color: scheme.outline
                  )
                ),
              ),
            )
          ]
        )
      )
    );
  }
}