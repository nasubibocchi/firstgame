import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/palette.dart';

class MyCircle extends PositionComponent with HasGameRef, Hitbox, Collidable {
  MyCircle() {
    addHitbox(HitboxRectangle(relation: Vector2.all(0.8)));
  }

  static const speed = 300.0;
  static const circleSize = 30.0;

  static Paint white = BasicPalette.white.paint();
  static Paint red = BasicPalette.red.paint();
  static Paint blue = BasicPalette.blue.paint();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size.setValues(circleSize, circleSize);
    anchor = Anchor.center;
  }

  @override
  void render(Canvas c) {
    super.render(c);
    c.drawCircle(Offset.zero, circleSize, white);
  }

  @override
  void update(double dt) {
    super.update(dt);
    height -= speed * dt;
  }

  @override
  void removeHitBox (HitboxShape shape) {
    super.removeHitbox(shape);

  }
  
}
