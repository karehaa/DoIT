import 'package:flutter/material.dart';
import 'package:to_do_app/calendar.dart';
import 'package:to_do_app/todo_page.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "Do!T",
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Calendar(),
              TodoPage(),
            ],
          ),
        ),
      ),
    ),
  );
}
