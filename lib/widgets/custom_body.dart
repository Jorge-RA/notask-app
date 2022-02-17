import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/providers/task_provider.dart';
import 'package:to_do_list/widgets/widgets.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SearchButton(),
        const Encabezado(),
        TitleList(text: 'Tareas Realizadas (${taskProvider.tasksDone.length})'),
        ...CustomSlidableList(taskProvider.tasksDone),
        TitleList(text: 'Tareas NO Realizadas (${taskProvider.tasks.length})'),
        ...CustomSlidableList(taskProvider.tasks),
      ],
    );
  }
}

class TitleList extends StatelessWidget {
  final String text;
  const TitleList({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      width: double.infinity,
      child: Text(
        text,
        style: GoogleFonts.dosis(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
