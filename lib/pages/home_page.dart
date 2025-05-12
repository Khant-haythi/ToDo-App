import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialog_box.dart';

import '../util/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  //reference the hive box
  final _mybox = Hive.box('mybox');

  //text controller
  final _controller = TextEditingController();

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {

    //if this is the 1st time ever opening the app , then create default data
    if(_mybox.get("TODOLIST") == null) {
      db.createInitialData();

    }else {
      //there already exists data
      db.loadData();
    }
    super.initState();
  }
  //checkbox was tapped
  void checkBoxChanged(bool? value,int index){
      setState(() {
        db.toDoList[index][1] = !db.toDoList[index][1];
      });
      db.updateDatabase();
  }

//save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //create a new Task
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
      return DialogBox(
        controller: _controller ,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    },);
}

//delete Task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
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
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return TodoTitle(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
              deleteFunction: (context) => deleteTask(index),
          );
        },
      )
    );
  }
}
