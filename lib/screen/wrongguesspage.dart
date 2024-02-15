import 'package:flutter/material.dart';

class WrongGuessPage extends StatefulWidget {
  const WrongGuessPage({super.key});

  @override
  State<WrongGuessPage> createState() => _WrongGuessPageState();
}

class _WrongGuessPageState extends State<WrongGuessPage> {
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
