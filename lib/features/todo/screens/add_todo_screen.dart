import 'package:bloc_cubit_learning/features/todo/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late final TextEditingController titleController;

  @override
  void initState() {
    titleController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final taskCubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("My Todos",style: Theme.of(context).textTheme.titleLarge,),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
        child: Column(
          children: [
            TextFormField(controller: titleController,decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hint:Text("Enter the title"),
              labelText: "Title"
            ),),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                taskCubit.saveTask(
                  title: titleController.text,
                  isCompleted: false,
                );
                Navigator.pop(context);
              },
              child: Text("Save Task"),
            ),
          ],
        ),
      ),
    );
  }
}
