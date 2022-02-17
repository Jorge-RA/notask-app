// ignore_for_file: unnecessary_this

class Task {
  String? title;
  String? day;
  String? ocupation;
  int id = 0;
  bool? important = null;
  static int static_id = 0;

  Task(this.title, this.ocupation, this.day) {
    this.id = static_id++;
  }

  Task.fromMap(Map<String, dynamic> mapTask, {bool edit = false}) {
    this.title = mapTask['title']!;
    this.day = mapTask['day']!;
    this.ocupation = mapTask['ocupation']!;
    if (!edit) {
      this.id = static_id++;
    }
    print('Mi ID: ${this.id}');
  }
}
