import 'package:flame/components.dart';

class GameOver extends SpriteComponent with HasGameRef {
  GameOver()
      : super(
    size: Vector2.all(150.0),
  ) {
    anchor = Anchor.center;
  }

  @override
  Future<void> onLoad () async {
    super.onLoad();
    Vector2 gameSize = gameRef.size;
    sprite = await gameRef.loadSprite('game_over.png');
    position = Vector2(
      gameSize.x / 2,
      gameSize.y / 2,
    );
  }
}