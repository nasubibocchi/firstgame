import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'my_game.dart';

class MyGameWidget extends StatelessWidget {
  const MyGameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      backgroundColor: Colors.greenAccent,
      body: GameWidget(
        game: MyGame(height: size.height),
        backgroundBuilder: (BuildContext context) {
          return Center(
            child: Container(
              width: size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
              ),
            ),
          );
        },
      ),
    );
  }
}
