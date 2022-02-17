import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/providers/task_provider.dart';

taskDialog(BuildContext context, bool editOpcion, {int? indexTask}) {
  String? titleTask;
  String? descriptionTask;
  final taskProvider = Provider.of<TaskProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (context2) => AlertDialog(
      title: editOpcion
          ? Center(child: Text('Editar tarea'))
          : Center(child: Text('Agrega nueva tarea')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            onChanged: (value) {
              titleTask = value;
            },
          ),
          TextFormField(
            onChanged: (value) {
              descriptionTask = value;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context2).pop(),
          child: Text('Cancelar'),
        ),
        TextButton(
          child: const Text('Guardar'),
          onPressed: () {
            if (titleTask != null && descriptionTask != null) {
              if (editOpcion) {
              } else {}
              Navigator.of(context2).pop();
            }
          },
        ),
      ],
    ),
  );
}
