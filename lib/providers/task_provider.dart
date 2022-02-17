import 'package:flutter/cupertino.dart';
import 'package:to_do_list/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  final List<Task> _tasksDone = [];

  Map<String, bool> stateChoiceChips = {
    'hoy': false,
    'mañana': false,
    'proximos dias': false,
  };

  Map<String, bool> stateOcupation = {
    'Universidad': false,
    'Trabajo': false,
    'Deporte': false,
    'Otro': false
  };

  List<Task> get tasks => _tasks;
  List<Task> get tasksDone => _tasksDone;

  set tasks(List<Task> newTask) {
    tasks.addAll(newTask);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    _tasksDone.remove(task);
    notifyListeners();
  }

  void doneTask(Task task) {
    if (_tasksDone.contains(task)) {
    } else {
      task.important = false; //Cuando está en al lista de Task realizadas
      _tasksDone.add(task);
      _tasks.remove(task);
    }

    notifyListeners();
  }

  void setStateImportantTask(Task task) {
    final int index = _tasks.indexWhere((element) => task.id == element.id);
    if (index >= 0) {
      _tasks[index].important = true;
      notifyListeners();
    }
  }

  void setStateChoiceChips(Map<String, bool> misChoiceCHips) {
    stateChoiceChips['hoy'] = misChoiceCHips['hoy']!;
    stateChoiceChips['mañana'] = misChoiceCHips['mañana']!;
    stateChoiceChips['proximos dias'] = misChoiceCHips['proximos dias']!;
    notifyListeners();
  }

  void setStateOcupation(Map<String, bool> myOcupations) {
    stateOcupation['Universidad'] = myOcupations['Universidad']!;
    stateOcupation['Trabajo'] = myOcupations['Trabajo']!;
    stateOcupation['Deporte'] = myOcupations['Deporte']!;
    stateOcupation['Otro'] = myOcupations['Otro']!;
    notifyListeners();
  }
}
