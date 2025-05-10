import 'package:flutter/material.dart';

import '../util/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
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
      body: ListView(
        children: [
          TodoTitle(),
          TodoTitle(),
          TodoTitle(),
          TodoTitle(),

        ],
      )
    );
  }
}
