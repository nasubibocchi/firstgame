import 'dart:ui';
import 'dart:math';
import 'dart:async' as async;

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/palette.dart';

class Circle extends PositionComponent with HasGameRef, Hitbox, Collidable {
  Circle() {
    addHitbox(HitboxCircle());
  }

  static const speed = 10.0;
  static const circleSize = 20.0;

  static Paint white = BasicPalette.white.paint();
  static Paint red = BasicPalette.red.paint();
  static Paint blue = BasicPalette.blue.paint();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size.setValues(circleSize, circleSize);
    anchor = Anchor.center;

    Timer timer = Timer(1000);
    timer.start();

    ///1秒ごとに球をふらせる
    if (timer.isRunning() == true) {
      double myY = 0.0;
      async.Timer.periodic(const Duration(milliseconds: 500), (timer) {
        add(
          Circle()
            ..x = Random().nextDouble()
            ..y = myY,
        );
      });
    }
  }

  @override
  void render(Canvas c) {
    super.render(c);
    c.drawCircle(Offset.zero, circleSize, red);
  }

  @override
  void update(double dt) {
    super.update(dt);
    height -= speed;
  }

  @override
  void onRemove() {
    super.onRemove();
    removeAll(children);
  }
}
