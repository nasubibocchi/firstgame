import 'dart:math';
import 'dart:async' as async;

import 'package:firstgame/objects/character.dart';
import 'package:firstgame/objects/circle.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/timer.dart';

class MyGame extends FlameGame
    with
        DoubleTapDetector,
        TapDetector,
        LongPressDetector,
        HorizontalDragDetector {
  MyGame({required this.height, required this.width});

  double height;
  double width;
  bool running = true;

  @override
  Future<Character> prepareConponent() async {
    Character? character = Character(
        image: await images.load('sausage.png'), size: Vector2(50, 150));
    super.prepareComponent(Character(
        image: await images.load('sausage.png'), size: Vector2(50, 150)));
    return character;
  }

  ///ゲームスタート
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    Character character = await prepareConponent();

    // Character character = Character(
    //     image: await images.load('sausage.png'), size: Vector2(50, 150));

    //キャラを配置
    add(character);

    Timer timer = Timer(60000.0);
    timer.start();

    ///1秒ごとに球をふらせる
    if (timer.isRunning() == true) {
      double myY = 0.0;
      async.Timer.periodic(const Duration(milliseconds: 500), (timer) {
        add(
          Circle()
            ..x = (Random().nextInt((width * 0.9).toInt())).toDouble()
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
        // remove(c);
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

  @override
  Future<void> onLongPressMoveUpdate(LongPressMoveUpdateInfo info) async {
    Character character = await prepareConponent();
    character.position += Vector2(info.raw.offsetFromOrigin.dx, 0.0);
  }

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
