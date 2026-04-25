import 'package:bloc_cubit_learning/features/todo/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<ToDo>> {
  TodoCubit() : super([]);
  void saveTask({required String title, required bool isCompleted}) {
    final newTodo = ToDo(
      id: DateTime.now().toIso8601String(),
      title: title,
      isCompleted: isCompleted,
    );
    final newList = [newTodo, ...state];
    emit(newList);
  }

  void removeTask({required String id}) {
    final newTodos = List<ToDo>.from(
      state,
    ).where((task) => task.id != id).toList();
    emit(newTodos);
  }

  void toggleCompleted({required String id}) {
    final newTodos = List<ToDo>.from(
      state,
    ).map((task){
      final updated = task.id == id ? task.copyWith(isCompleted : !task.isCompleted) : task;
      return updated;
    }).toList();
    emit(newTodos);
  }
}
