import 'package:firstgame/games/my_game/my_game_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyGameWidget()));
            },
            style: ElevatedButton.styleFrom(
              elevation: 5.0,
              primary: Colors.black54,
              shape: const StadiumBorder(),
            ),
            child: const Text('たまゲーム', style: TextStyle(color: Colors.white)),
          ),
        ]),
      ),
    );
  }
}
