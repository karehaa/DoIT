import 'package:flutter/material.dart';
import 'package:to_do_app/calendar.dart';
import 'package:to_do_app/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(context) {
    return const Scaffold(
      body: Center(
        child: Stack(
          children: [
            Calendar(),
            TodoPage(),
          ],
        ),
      ),
    );
  }
}
