import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_number_game/screen/correctguesspage.dart';
import 'package:guess_number_game/screen/gameoverpage.dart';
import 'package:guess_number_game/screen/wrongguesspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: const Center(
        child: GuessNumberForm(),
      ),
    );
  }
}

class GuessNumberForm extends StatefulWidget {
  const GuessNumberForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GuessNumberFormState createState() => _GuessNumberFormState();
}

class _GuessNumberFormState extends State<GuessNumberForm> {
  final TextEditingController _controller = TextEditingController();
  int _attempts = 0;
  final int _secretNumber = 7;

  void _checkGuess(BuildContext context) {
    int guess = int.tryParse(_controller.text) ?? 0;
    if (guess == _secretNumber) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CorrectGuessPage()),
      );
    } else {
      _attempts++;
      if (_attempts >= 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GameOverPage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WrongGuessPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Image.asset(
              'pic.png',
              width: 600.0,
              height: 240.0,
              // fit: BoxFit.cover,
            ),
          ),
          const Text(
            'I have a secret number in my mind (1 - 10). You\nhave 3 chances to guess it.',
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
            ),
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
              onPressed: () => _checkGuess(context),
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  'Submit',
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
    );
  }
}
