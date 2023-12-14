import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  final Widget icon;
  final String label;
  final Function() on_tap;
  final bool selected;

  const ListElement({super.key, required this.icon, required this.label, required this.on_tap, required this.selected});

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: scheme.outline))
      ),
      child: ListTile(
        leading: icon,
        title: Row(
          children: [
            Text(label,
              style: TextStyle(
                color: scheme.outline
              )
            )
          ],
        ),
        onTap: on_tap,
      ),
    );
  }
}