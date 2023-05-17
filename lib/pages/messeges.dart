import 'package:flutter/material.dart';
class Messeges extends StatefulWidget {
  const Messeges({Key? key}) : super(key: key);

  @override
  State<Messeges> createState() => _MessegesState();
}

class _MessegesState extends State<Messeges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,

        title: Text('Messeges'),
      ),
      body: null,
    );
  }
}
