import 'package:bloc_cubit_learning/features/todo/screens/add_todo_screen.dart';
import 'package:bloc_cubit_learning/features/todo/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todo_cubit.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Todos",style: Theme.of(context).textTheme.titleLarge,),
        elevation: 5,
      ),
      body: BlocBuilder<TodoCubit,List<ToDo>>(
        bloc: todoCubit,
        builder: (context,todoList) {
          return Column(
            children: [
              todoList.isEmpty ?
                  Center(
                    child: Text("No Task added yet. Tap '+' to add Task",style: Theme.of(context).textTheme.titleMedium,)
                  ) :
                  Expanded(
                    child: ListView.builder(
                        itemCount: todoList.length,
                        itemBuilder: (context,index){
                      final task = todoList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            leading: InkWell(
                              child: Checkbox(value: task.isCompleted, onChanged: (val){
                                todoCubit.toggleCompleted(id: task.id);
                              }),
                            ),
                            title: Text(task.title,style: Theme.of(context).textTheme.titleMedium,),
                            trailing: InkWell(onTap: ()=>todoCubit.removeTask(id: task.id),child: Icon(Icons.delete_outline,color: Colors.redAccent,),),
                          ),
                        ),
                      );
                    }),
                  )

            ],
          );
        }
      ),
      floatingActionButton: ElevatedButton(onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddTodoScreen()));
      }, child: Text('Add Task')),
    );
  }
} 
