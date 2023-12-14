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
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: TextField(
        maxLength: limit,
        controller: controller,
        minLines: min_rows,
        maxLines: max_rows,
        style: const TextStyle(
          color: Colors.white
        ),
        decoration: InputDecoration(
          counterStyle: const TextStyle(color: Colors.white),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w200
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          )
        )
      ),
    );
  }
}