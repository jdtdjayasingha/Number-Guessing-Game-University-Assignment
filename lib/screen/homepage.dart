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
  final int _secretNumber = 7; // Change this to any secret number

  void _checkGuess(BuildContext context) {
    int guess = int.tryParse(_controller.text) ?? 0;
    if (guess == _secretNumber) {
      //Navigator.pushNamed(context, '/correct');
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'I have a secret number in my mind (1 - 10). You have 3 chances to guess it.',
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
        ElevatedButton(
          onPressed: () => _checkGuess(context),
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
