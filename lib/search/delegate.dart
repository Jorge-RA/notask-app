import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/providers/task_provider.dart';
import 'package:to_do_list/widgets/custom_slidable.dart';

import '../widgets/custom_slidable_list.dart';

Color _primaryColor = Colors.purple;

class ToDoListDelegate extends SearchDelegate {
  List<Task> filterListTask = [];

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
      appBarTheme: AppBarTheme().copyWith(
          elevation: 0,
          backgroundColor: Colors.white,
          actionsIconTheme: IconThemeData(color: Colors.grey)),
      // ignore: prefer_const_constructors
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: _primaryColor),
        focusedBorder: InputBorder.none,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: _primaryColor,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, ''),
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [...CustomSlidableList(filterListTask)]));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;
    if (tasks.isEmpty) return Container();

    filterListTask = tasks
        .where(
          (task) => (task.title!.toLowerCase().contains(query.toLowerCase()) ||
              task.ocupation!.toLowerCase().contains(query.toLowerCase()) ||
              task.day!.toLowerCase().contains(query.toLowerCase())),
        )
        .toList();

    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [...CustomSlidableList(filterListTask)]));
  }
}
