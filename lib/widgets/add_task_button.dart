// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/widgets.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      tooltip: 'Agregar nueva tarea',
      onPressed: () => AddTaskButton.addTask(context),
    );
  }

  static addTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const BottomSheetTask();
      },
    );
  }
}
