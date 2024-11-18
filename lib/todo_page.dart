import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});
  @override
  State<TodoPage> createState() {
    return _TodoPage();
  }
}

class _TodoPage extends State<TodoPage> {
  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(top: 65),
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
            const Expanded(child: Center(child: Text("Todo Page")))
          ],
        ),
      ),
    );
  }
}
