import 'package:flutter/material.dart';
import 'package:todoapp/util/dialog_box.dart';

import '../util/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

 //List of todo tasks
  List toDoList = [
    ["Make Tutorial",false],
    ["Do Exercise",false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value,int index){
      setState(() {
        toDoList[index][1] = !toDoList[index][1];
      });
  }

  //create a new Task
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
      return DialogBox();
    },);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO'),
        centerTitle: true,
        backgroundColor: Colors.yellow[400],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context,index){
          return TodoTitle(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
          );
        },
      )
    );
  }
}
