import 'dart:math';
import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dice Game'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: const DiceHomePage(),
    );
  }
}

class DiceHomePage extends StatefulWidget {
  const DiceHomePage({super.key});

  @override
  State<DiceHomePage> createState() => _DiceState();
}

class _DiceState extends State<DiceHomePage> {
  // initialize the dice to 1
  int playerOne = 1;
  int playerTwo = 1;
  String result = "";

  // Controllers for TextField
  final TextEditingController playerOneController = TextEditingController();
  final TextEditingController playerTwoController = TextEditingController();

  // Names of the players
  String playerOneName = "Player 1";
  String playerTwoName = "Player 2";

  // * function for rolling dice
  void rollDice() {
    setState(() {
      //   random the dice
      playerOne =  Random().nextInt(6) + 1;
      playerTwo =  Random().nextInt(6) + 1;

      //   check player win
      if (playerOne > playerTwo) {
        result = "$playerOneName wins";
      } else if (playerTwo > playerOne) {
        result = "$playerTwoName wins";
      } else {
        result = "Draw";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  MaterialButton(
                    child: Image.asset(
                      'images/dice$playerOne.png',
                      width: 150,
                      height: 150,
                    ),
                    onPressed: () {
                      rollDice();
                    },
                  ),
                  TextField(
                    controller: playerOneController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Player 1 Name',
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        playerOneName = value.isNotEmpty ? value : "Player 1";
                      });
                    },
                  ),
                  Text(
                    playerOneName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  MaterialButton(
                    child: Image.asset(
                      'images/dice$playerTwo.png',
                      width: 150,
                      height: 150,
                    ),
                    onPressed: () {
                      rollDice();
                    },
                  ),
                  TextField(
                    controller: playerTwoController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Player 2 Name',
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        playerTwoName = value.isNotEmpty ? value : "Player 2";
                      });
                    },
                  ),
                  Text(
                    playerTwoName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),

          //   create space between dice and result
          const SizedBox(
            height: 20,
          ),

          Text(
            result,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
