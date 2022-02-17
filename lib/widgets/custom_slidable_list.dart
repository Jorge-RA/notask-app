import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widgets/widgets.dart';

CustomSlidableList(List<Task> listTask) {
  List<Widget> listSlidable = [];
  listTask = listTask.reversed.toList();
  listTask.forEach((task) {
    listSlidable.add(
      CustomSlidable(task: task),
    );
  });

  return listSlidable;
}
