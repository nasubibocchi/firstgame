import 'package:firstgame/common_functions.dart';
import 'package:firstgame/entities/direction.dart';
import 'package:firstgame/objects/character.dart';
import 'package:firstgame/objects/circle.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame
    with HasCollidables {

  bool running = true;

  final Character character = Character();
  final Circle circle = Circle();
  
  final commonFunctions = CommonFunctions();

  void onJoypadDirectionChanged(Direction direction) {
    character.direction = direction;
  }

  ///ゲームスタート
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    //キャラを配置
    add(character);
    add(circle);
    
  }


  

  // ///タップしたら
  // @override
  // void onTapUp(TapUpInfo info) {
  //   final touchPoint = info.eventPosition.game;
  //
  //   final handled = children.any((c) {
  //     if (c is PositionComponent && c.containsPoint(touchPoint)) {
  //       // remove(c);
  //       return true;
  //     }
  //     return false;
  //   });
  //
  //   if (!handled) {
  //     ///TODO: ここにキャラが動く処理を書く
  //     // add(Square()..position = touchPoint);
  //     // add(Circle()..position = touchPoint);
  //   }
  // }

// ///ダブルタップでアニメーション停止
// @override
// void onDoubleTap() {
//   Timer timer = Timer(60.0);
//   if (running) {
//     pauseEngine();
//     timer.pause();
//   } else {
//     resumeEngine();
//   }
//   running = !running;
// }
}
