// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:notes/components/list_element.dart';
import 'package:notes/util/storage.dart';
import 'package:notes/util/themes.dart';
import 'package:provider/provider.dart';

class Appearance extends StatefulWidget {
  const Appearance({super.key});

  @override
  State<Appearance> createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {
  Storage storage = Storage();

  void changeTheme(BuildContext context, ThemeData theme) {
    setState(() {
      Provider.of<ThemeManager>(context, listen: false).changeTheme(theme);
    });
    storage.theme = theme;
    storage.updateTheme();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: scheme.background,
      appBar: AppBar(
        backgroundColor: scheme.secondary,
        elevation: 10,
        shadowColor: scheme.shadow,
        centerTitle: true,
        title: Text("Appearance",
         style: TextStyle(
          color: scheme.onSecondary
         )
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              icon: Icon(Icons.arrow_back_ios, color: scheme.onSecondary)
            );
          }
        )
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: scheme.onBackground,
          borderRadius: BorderRadius.circular(10)
        ),
        child: ListView.builder(
          itemCount: Themes.list.length,
          itemBuilder: (context, index) {
            return ListElement(
              icon: CircleAvatar(
                backgroundColor: (Themes.list[index][0] as ThemeData).colorScheme.primary,
                radius: 15,
              ),
              label: Themes.list[index][1],
              on_tap: () {
                changeTheme(context, Themes.list[index][0]);
              },
              selected: Theme.of(context).colorScheme.primary == (Themes.list[index][0] as ThemeData).colorScheme.primary
            );
          },
        )
      )
    );
  }
}