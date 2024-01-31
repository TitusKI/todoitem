import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final  ontapbar;
  final  ondeleteclicked;

  const ToDoItem({super.key, required this.todo, required this.ontapbar, required this.ondeleteclicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          ontapbar(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        // Leading is A widget to display before the title.
        // Typically an Icon or a CircleAvatar widget
        leading:  Icon(
          todo.isDone ? Icons.check_box: Icons.check_box_outline_blank,
          color: tdpurple,
        ),
        title: Text(
          todo.todotext!,
          style:  TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough: null,
          ),
        ),
        // trailing is A widget to display after the title.
        // Typically an Icon widget.
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed:(){
              ondeleteclicked(todo.id);
           }
          ),
        ),
      ),
    );
  }
}

