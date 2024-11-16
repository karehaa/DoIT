import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});
  @override
  State<Calendar> createState() {
    return _Calendar();
  }
}

class _Calendar extends State<Calendar> {
  @override
  Widget build(context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(45, 114, 143, 1),
        ),
        child: const Center(
          child: Text("Calendar"),
        ));
  }
}
