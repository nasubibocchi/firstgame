import 'dart:math';
import 'dart:async' as async;

import 'package:firstgame/objects/character.dart';
import 'package:firstgame/objects/circle.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/timer.dart';

class MyGame extends FlameGame with DoubleTapDetector, TapDetector {
  MyGame({required this.height});
  double height;
  bool running = true;

  ///ゲームスタート
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    //キャラを配置
    add(
      Character()
        ..x = 110.0
        ..y = height * 0.85 - Character.squareSize,
    );
    print(Character.squareSize);

    Timer timer = Timer(60000.0);
    timer.start();

    if (timer.current > 10) {
      timer.stop();
      print('finished');
    }

    ///1秒ごとに球をふらせる
    if (timer.isRunning() == true) {
      double myY = 0.0;
      async.Timer.periodic(const Duration(milliseconds: 500), (timer) {
        add(
          Circle()
            ..x = (Random().nextInt(230) + 70).toDouble()
            ..y = myY,
        );
      });
    }
  }

  @override
  void onRemove() {
    super.onRemove();
    removeAll(Circle().children);
  }

  ///タップしたら
  @override
  void onTapUp(TapUpInfo info) {
    final touchPoint = info.eventPosition.game;

    final handled = children.any((c) {
      if (c is PositionComponent && c.containsPoint(touchPoint)) {
        remove(c);
        return true;
      }
      return false;
    });

    if (!handled) {
      ///TODO: ここにキャラが動く処理を書く
      // add(Square()..position = touchPoint);
      // add(Circle()..position = touchPoint);
    }
  }

  ///ダブルタップでアニメーション停止
  @override
  void onDoubleTap() {
    Timer timer = Timer(60.0);
    if (running) {
      pauseEngine();
      timer.pause();
    } else {
      resumeEngine();
    }
    running = !running;
  }
}
