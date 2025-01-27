import 'package:flutter/material.dart';

class TodoWindowButton extends StatefulWidget {
  const TodoWindowButton({super.key});

  @override
  State<TodoWindowButton> createState() => _TodoWindowButton();
}

class _TodoWindowButton extends State<TodoWindowButton> {
  final textSent = TextEditingController();

  @override
  void initState() {
    super.initState();
    textSent.addListener(sendText);
  }

  @override
  void dispose() {
    textSent.dispose();
    super.dispose();
  }

  String sendText() {
    return textSent.text;
  }

  @override
  Widget build(context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("What to do?"),
              content: Column(
                children: [
                  const TextField(),
                  ElevatedButton(
                    onPressed: sendText,
                    child: const Text("Enter"),
                  )
                ],
              ),
            );
          }),
      child: const Icon(Icons.add),
    );
  }
}
