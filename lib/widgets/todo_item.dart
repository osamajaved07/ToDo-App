// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todos_app/constants/Colors.dart';
import 'package:todos_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.todo,required this.onToDoChanged,required this.onDeleteItem});


  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,

        leading: Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank_outlined, color: tdBlue,),

        title: Text(todo.todoText!, style: TextStyle(
          fontSize: 16,
          color: tdBlack,
          decoration: todo.isDone? TextDecoration.lineThrough : null
        ),),


        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),

          ),

          child: IconButton(
            iconSize: 24,
            onPressed: (){
              // print("Clicked on IconButton");
              onDeleteItem(todo.id);
            }, 
            icon: Icon(Icons.delete,),
          color: Colors.white,),
        ),
      ),
    );
  }
}