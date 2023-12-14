import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final String hint;
  final int min_rows;
  final int max_rows;
  final TextEditingController controller;
  final int limit;

  const TextInput({super.key,
    required this.label,
    required this.hint,
    this.min_rows = 1,
    this.max_rows = 1,
    required this.controller,
    this.limit = 10
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: TextField(
        maxLength: limit,
        controller: controller,
        minLines: min_rows,
        maxLines: max_rows,
        style: TextStyle(
          color: scheme.onSecondary
        ),
        decoration: InputDecoration(
          counterStyle: TextStyle(color: scheme.onSecondary),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: TextStyle(
            color: scheme.onSecondary,
            fontWeight: FontWeight.w200
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: scheme.onSecondary,
            fontWeight: FontWeight.w400
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: scheme.onSecondary)
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: scheme.onSecondary)
          )
        )
      ),
    );
  }
}