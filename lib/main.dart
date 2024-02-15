import 'package:flutter/material.dart';
import 'package:guess_number_game/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Number Guessing Game University Assignment",
      home: HomePage(),
    );
  }
}
