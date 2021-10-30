import 'package:firstgame/common_functions.dart';
import 'package:firstgame/entities/direction.dart';
import 'package:firstgame/entities/joypad.dart';
import 'package:firstgame/objects/character.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'my_game.dart';

class MyGameWidget extends StatefulWidget {
  const MyGameWidget({Key? key}) : super(key: key);

  @override
  _MyGameWidgetState createState() => _MyGameWidgetState();
}

class _MyGameWidgetState extends State<MyGameWidget> {
  MyGame myGame = MyGame();
  final Character character = Character();

  final commonFunctions = CommonFunctions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      backgroundColor: Colors.greenAccent,
      body: Stack(children: [
        GameWidget(
          game: myGame,
          backgroundBuilder: (BuildContext context) {
            return Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                ),
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Joypad(onDirectionChanged: onJoypadDirectionChanged),
          ),
        )
      ]),
    );
  }

  void onJoypadDirectionChanged(Direction direction) {
    myGame.onJoypadDirectionChanged(direction);
  }

  @override
  Future<void> gameOver(BuildContext context) async {
    var count = 0;

    if (character.isGameOver == true) {
      await commonFunctions.myShowDialog(
        context,
        'Game Over',
        () => Navigator.popUntil(context, (route) => count++ >= 2),
      );
    }
  }
}
