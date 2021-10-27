import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/input.dart';

class Character extends SpriteComponent {

  Character({required Image image, required Vector2 size})
      : super(
          sprite: Sprite(image),
          size: size,
        ) {
    anchor = Anchor.bottomCenter;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    position = Vector2(
      gameSize.x /2,
      gameSize.y /5.0 * 5.0,
    );
  }

  @override
  void update (double dt) {
    super.update(dt);
  }

}

