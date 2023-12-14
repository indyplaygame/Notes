// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  final String task_name;
  final String task_description;
  final bool completed;
  final Function(bool?)? on_change;
  final Function(BuildContext)? delete_function;
  final Function(BuildContext)? edit_function;

  const TaskTile({super.key,
    required this.task_name,
    required this.task_description,
    required this.completed,
    required this.on_change,
    required this.delete_function,
    required this.edit_function
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: edit_function,
              icon: Icons.edit,
              backgroundColor: Colors.grey[400]!,
              borderRadius: BorderRadius.circular(10),
            ),
            SlidableAction(
              onPressed: delete_function,
              icon: Icons.delete,
              backgroundColor: Colors.red[400]!,
              borderRadius: BorderRadius.circular(10),
            )
          ]
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: scheme.primary,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              Checkbox(value: completed, onChanged: on_change, activeColor: scheme.onPrimary, checkColor: scheme.primary),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task_name,
                      style: TextStyle(
                        color: scheme.onPrimary,
                        fontSize: 20,
                        decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
                        decorationThickness: 1,
                        decorationColor: scheme.onPrimary
                      ),
                    ),
                    Text(task_description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: scheme.onPrimary,
                        fontSize: 13,
                        decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
                        decorationThickness: 1.5,
                        decorationColor: scheme.onPrimary
                      ),
                    )
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}