import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget {
  const TodoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            //checkbox
            //Checkbox(value: value, onChanged: onChanged),

            //task name
            Text("Make Tutorial"),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.yellow,
        borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
