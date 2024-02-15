import 'package:flutter/material.dart';
import 'package:guess_number_game/screen/homepage.dart';

class CorrectGuessPage extends StatefulWidget {
  const CorrectGuessPage({super.key});

  @override
  State<CorrectGuessPage> createState() => _CorrectGuessPageState();
}

class _CorrectGuessPageState extends State<CorrectGuessPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 200, 230, 201),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Yes! you guessed it right. My secret number is'),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '8',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      'Start the Game Again',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
