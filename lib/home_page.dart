import 'package:flutter/material.dart';
import 'package:to_do_app/calendar.dart';
import 'package:to_do_app/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  final double minToDoPageHeight = 80.0;
  final double dragThreshold = 0.3;
  bool isDragUp = true;
  double toDoPageScrollHeight = 0.0;
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    )..addListener(() {
        setState(() {
          toDoPageScrollHeight = _heightAnimation.value;
        });
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _animateToHeight(double targetHeight, Size screenSize) {
    final maxToDoPageHeight = screenSize.height * 0.92;
    targetHeight = targetHeight.clamp(minToDoPageHeight, maxToDoPageHeight);

    _heightAnimation = Tween<double>(
      begin: toDoPageScrollHeight,
      end: targetHeight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutQuart,
        reverseCurve: Curves.easeInQuart,
      ),
    );

    _animationController.reset();
    _animationController.forward();

    setState(() {
      isDragUp = targetHeight > screenSize.height * 0.5;
    });
  }

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
              left: 0.0,
              right: 0.0,
              child: GestureDetector(
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  final double draggedAmount =
                      screenSize.height - details.globalPosition.dy;

                  setState(() {
                    toDoPageScrollHeight = draggedAmount.clamp(
                        minToDoPageHeight, maxToDoPageHeight);
                  });
                },
                onVerticalDragEnd: (DragEndDetails details) {
                  final double dragPercentage =
                      toDoPageScrollHeight / maxToDoPageHeight;

                  final double targetHeight = dragPercentage > dragThreshold
                      ? maxToDoPageHeight
                      : minToDoPageHeight;

                  _animateToHeight(targetHeight, screenSize);
                },
                child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutQuad,
                        height: toDoPageScrollHeight,
                        constraints: BoxConstraints(
                          minHeight: minToDoPageHeight,
                          maxHeight: maxToDoPageHeight,
                        ),
                        child: TodoPage(
                          screenSize: screenSize,
                          pageHeight: toDoPageScrollHeight,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
