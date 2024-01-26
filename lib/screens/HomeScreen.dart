// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, deprecated_member_use, prefer_const_constructors_in_immutables, unused_field

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todos_app/constants/Colors.dart';
import 'package:todos_app/model/todo.dart';
import 'package:todos_app/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];
@override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 222, 248, 254),


      appBar: appBar(),
      body: Stack(
        children: [
          Container(
        // padding: EdgeInsets.symmetric(
        //   horizontal: 20,
        //   vertical: 15
        // ),
        child: Column(
          children: [
            searchBox(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 8, right: 8),
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20, left: 8),
              
                    child: Text("All ToDos", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500
                    ),),
                  ),
        
                  for(ToDo todoo in _foundToDo.reversed)
                  ToDoItem(
                    todo: todoo,
                    onToDoChanged: _handleToDoChange,
                    onDeleteItem: _deleteToDoItem,),
                 
                ],
              ),
            )
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: Container(
              margin: EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20),

                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [BoxShadow(color: Colors.grey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                  )],

                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: InputDecoration(
                    hintText: "Add a new todo item.",
                    border: InputBorder.none  
                  ),
                ),
            )),
            Container(
              
              margin: EdgeInsets.only(
                bottom: 20,
                right: 20,
              ),
              

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape:BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  primary: tdBlue,
                  minimumSize:Size(60, 60),

                  elevation: 10
                ),
                onPressed: (){
                  _addToDoItem(_todoController.text);
                }, 
                child: Text("+", 
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white
                    

              ),)),
            )
          ],
          
        ),

      ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {

    setState(() {
      todo.isDone = !todo.isDone;

    });

  }


  void _deleteToDoItem (String id) {
    setState(() {
    todosList.removeWhere((item) => item.id == id);
  
    });
    
  }

  void _addToDoItem (String toDo) {

    setState(() {
    todosList.add(ToDo(id:DateTime.now().millisecondsSinceEpoch.toString(), 
    todoText: toDo));  
    });
    _todoController.clear();
    

  }

  void _runFilter (String enteredKeyword) {
    List <ToDo> results = [];
    if(enteredKeyword.isEmpty) {
      results = todosList;

    } else  {
      results = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundToDo = results;
    });

  }






  Container searchBox() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 10
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(Icons.search_rounded),
                  hintText: "Search",
                  // prefixIconConstraints: BoxConstraints(
                  //   maxHeight: 30,
                  //   minWidth: 45
                  // ),
                  border: InputBorder.none
                ),
      
              ),
            )
          ],
        ),
      );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBgColor,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: tdBlack, size: 30,),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/pic.jpg',),
            ),
          )
        ],
      ),
    );
  }
}