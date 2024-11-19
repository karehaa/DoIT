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
  final double minToDoPageHeight = 80.0;
  bool isDragUp = true;
  double toDoPageScrollHeight = 0.0;
  @override
  Widget build(context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double maxToDoPageHeight = screenSize.height * 0.92;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            const Calendar(),
            Positioned(
              bottom: 0.0,
              child: AnimatedContainer(
                constraints: BoxConstraints(
                    maxHeight: maxToDoPageHeight, minHeight: minToDoPageHeight),
                curve: Curves.easeOut,
                height: toDoPageScrollHeight,
                duration: const Duration(microseconds: 300),
                child: GestureDetector(
                  onVerticalDragUpdate: (DragUpdateDetails data) {
                    double draggedAmount =
                        screenSize.height - data.globalPosition.dy;
                    if (isDragUp) {
                      if (draggedAmount < 100) {
                        toDoPageScrollHeight = draggedAmount;
                      } else {
                        toDoPageScrollHeight = maxToDoPageHeight;
                      }
                    } else {
                      double draggedDown = maxToDoPageHeight - draggedAmount;
                      if (draggedDown < 100) {
                        toDoPageScrollHeight = draggedDown;
                      } else {
                        toDoPageScrollHeight = 0.0;
                      }
                    }
                    setState(() {});
                  },
                  onVerticalDragEnd: (DragEndDetails data) {
                    if (toDoPageScrollHeight == maxToDoPageHeight) {
                      isDragUp = false;
                    } else if (toDoPageScrollHeight == 0.0) {
                      isDragUp = true;
                    }
                    setState(() {});
                  },
                  child: TodoPage(
                    screenSize: screenSize,
                    pageHeight: toDoPageScrollHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
