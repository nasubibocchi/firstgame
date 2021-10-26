import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Circle extends PositionComponent {
  static const speed = 10.0;
  static const circleSize = 20.0;

  static Paint white = BasicPalette.white.paint();
  static Paint red = BasicPalette.red.paint();
  static Paint blue = BasicPalette.blue.paint();

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
  Future<void> onLoad() async {
    super.onLoad();
    size.setValues(circleSize, circleSize);
    anchor = Anchor.center;
  }
}
