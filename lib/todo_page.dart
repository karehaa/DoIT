import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage(
      {super.key, required this.screenSize, required this.pageHeight});
  final Size screenSize;
  final double pageHeight;
  @override
  State<TodoPage> createState() {
    return _TodoPage();
  }
}

class _TodoPage extends State<TodoPage> {
  @override
  Widget build(context) {
    return Container(
      width: widget.screenSize.width,
      height: widget.pageHeight,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(229, 229, 229, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(49), topRight: Radius.circular(49))),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 110,
              height: 10,
              margin: const EdgeInsets.only(top: 12),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black),
            ),
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: const TextField(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
