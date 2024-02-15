import 'package:flutter/material.dart';

class CorrectGuessPage extends StatefulWidget {
  const CorrectGuessPage({super.key});

  @override
  State<CorrectGuessPage> createState() => _CorrectGuessPageState();
}

class _CorrectGuessPageState extends State<CorrectGuessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Guess Game",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 5,
      ),
    );
  }
}
