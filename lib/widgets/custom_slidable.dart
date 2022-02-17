import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/providers/task_provider.dart';
import 'package:to_do_list/widgets/widgets.dart';

class CustomSlidable extends StatelessWidget {
  final Task task;

  const CustomSlidable({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Slidable(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              task.title!,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
            ),
          ),
          subtitle: Text(task.ocupation!),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (task.important == true)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.wb_incandescent_outlined, color: Colors.red),
                    Text('Importante', style: TextStyle(color: Colors.red))
                  ],
                ),
              if (task.important == false)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.check_circle_outline_rounded,
                        color: Colors.green),
                    Text('Listo', style: TextStyle(color: Colors.green))
                  ],
                ),
              const SizedBox(width: 10),
              const Icon(Icons.align_horizontal_right_rounded),
            ],
          ),
        ),
      ),
      //----El StartActionPane es para hacer slide desde la izquierda
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.7,
        children: [
          SlidableAction(
            icon: Icons.notification_important_outlined,
            label: 'Importante',
            backgroundColor: Colors.yellow,
            onPressed: (context) {
              print('Importante!!');
              taskProvider.setStateImportantTask(task);
            },
          ),
          SlidableAction(
            icon: Icons.delete_forever,
            label: 'Eliminar',
            backgroundColor: Colors.red,
            onPressed: (context) {
              print('Eliminar');
              taskProvider.removeTask(task);
            },
          ),
          SlidableAction(
            icon: Icons.check,
            label: 'Realizado',
            backgroundColor: Colors.green,
            onPressed: (context) {
              print('Hecho');
              taskProvider.doneTask(task);
            },
          ),
        ],
      ),
    );
  }
}
