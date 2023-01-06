// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: file_names

class Task {
  final String name;
  final String Day;
  final String task;

  Task(
    this.name,
    this.Day,
    this.task,
  );

  Task copyWith({
    String? name,
    String? Day,
    String? task,
  }) {
    return Task(
      name ?? this.name,
      Day ?? this.Day,
      task ?? this.task,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'Day': Day,
      'task': task,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      map['name'] as String,
      map['Day'] as String,
      map['task'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Task(name: $name, Day: $Day, task: $task)';

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.name == name && other.Day == Day && other.task == task;
  }

  @override
  int get hashCode => name.hashCode ^ Day.hashCode ^ task.hashCode;
}
