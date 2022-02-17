// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/providers/task_provider.dart';

Map<String, dynamic> newTask = {
  'title': '',
  'day': '',
  'ocupation': null,
};

class BottomSheetTask extends StatelessWidget {
  const BottomSheetTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _IntroText(),
          _CustomTextFormField(),
          _Day(),
          _CustomListTile(text: 'Universidad', color: Colors.blue),
          _CustomListTile(text: 'Trabajo', color: Colors.red),
          _CustomListTile(text: 'Deporte', color: Colors.green),
          _CustomListTile(text: 'Otro', color: Colors.orange),
          Expanded(child: SizedBox()),
          _CustomElevatedButton(),
        ],
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String text;
  final Color color;
  const _CustomListTile({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final stateOcupation = taskProvider.stateOcupation;
    return CheckboxListTile(
      title: Row(
        children: [
          Icon(
            Icons.circle_outlined,
            color: color,
            size: 20,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      value: stateOcupation[text],
      activeColor: Colors.purple,
      onChanged: (bool? value) {
        stateOcupation[text] = value!;
        taskProvider.setStateOcupation(stateOcupation);
      },
    );
  }
}

class _CustomElevatedButton extends StatelessWidget {
  const _CustomElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 156, 0, 184),
          minimumSize: Size.fromWidth(double.infinity),
        ),
        onPressed: () {
          saveTask(context);

          Navigator.pop(context);
        },
        child: Container(
          child: Text(
            '+  Agregar tarea',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  saveTask(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    final stateChoiceChips = taskProvider.stateChoiceChips;
    final stateOcupation = taskProvider.stateOcupation;
    final aux = [];
    newTask['ocupation'] = newTask['day'] = '';

    stateOcupation.forEach((key, value) {
      if (value) {
        aux.add(key);
      }
    });
    newTask['ocupation'] = aux.join(', ');

    aux.clear();

    stateChoiceChips.forEach((key, value) {
      if (value) {
        aux.add(key);
      }
    });
    newTask['day'] = aux.join(', ');

    print(newTask);
    taskProvider.tasks = [Task.fromMap(newTask)];
  }
}

class _CustomTextFormField extends StatelessWidget {
  const _CustomTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        onChanged: (value) => newTask['title'] = value,
        decoration: InputDecoration(
          labelText: 'Escribe nueva tarea',
        ),
      ),
    );
  }
}

class _IntroText extends StatelessWidget {
  const _IntroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 5),
      child: Text(
        'Crear Nueva Tarea',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}

class _Day extends StatelessWidget {
  const _Day({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final stateChoiceChips = taskProvider.stateChoiceChips;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          ChoiceChip(
            selectedColor: Colors.purple,
            label: Text('Hoy'),
            selected: stateChoiceChips['hoy']!,
            onSelected: (value) {
              stateChoiceChips['hoy'] = value;
              taskProvider.setStateChoiceChips(stateChoiceChips);
            },
          ),
          SizedBox(width: 8),
          ChoiceChip(
            selectedColor: Colors.purple,
            label: Text('Mañana'),
            selected: stateChoiceChips['mañana']!,
            onSelected: (value) {
              stateChoiceChips['mañana'] = value;
              taskProvider.setStateChoiceChips(stateChoiceChips);
            },
          ),
          SizedBox(width: 8),
          ChoiceChip(
            selectedColor: Colors.purple,
            label: Text('Proximos días'),
            selected: stateChoiceChips['proximos dias']!,
            onSelected: (value) {
              stateChoiceChips['proximos dias'] = value;
              taskProvider.setStateChoiceChips(stateChoiceChips);
            },
          ),
        ],
      ),
    );
  }
}
