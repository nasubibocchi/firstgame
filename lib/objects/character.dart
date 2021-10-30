import 'package:firstgame/entities/direction.dart';
import 'package:firstgame/objects/circle.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/input.dart';

class Character extends SpriteComponent with HasGameRef, Hitbox, Collidable {
  Character()
      : super(
          size: Vector2.all(100.0),
        ) {
    anchor = Anchor.bottomCenter;
  }

  final double _playerSpeed = 300.0;
  Direction direction = Direction.none;
  Direction _collisionDirection = Direction.none;
  bool _hasCollided = false;
  bool isGameOver = false;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    Vector2 gameSize = gameRef.size;
    sprite = await gameRef.loadSprite('oct.png');
    position = Vector2(
      gameSize.x / 2,
      gameSize.y / 5.0 * 5.0 + 10,
    );
  }

  @override
  void onGameResize(Vector2 gameSize) {
    position = Vector2(
      gameSize.x / 2,
      gameSize.y / 5.0 * 5.0,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    moveCharacter(dt);
  }

  void moveCharacter(double dt) {
    switch (direction) {
      case Direction.up:
        if (canPlayerMoveUp()) {
          moveUp(dt);
        }
        break;
      case Direction.down:
        if (canPlayerMoveDown()) {
          moveDown(dt);
        }
        break;
      case Direction.left:
        if (canPlayerMoveLeft()) {
          moveLeft(dt);
        }
        break;
      case Direction.right:
        if (canPlayerMoveRight()) {
          moveRight(dt);
        }
        break;
      case Direction.none:
        break;
    }
  }

  void moveUp (double dt) {
    position.add(Vector2(0, dt * _playerSpeed));
  }
  void moveDown (double dt) {
    position.add(Vector2(0, dt * _playerSpeed * (-1)));
  }
  void moveLeft (double dt) {
    position.add(Vector2(dt * _playerSpeed * (-1), 0));
  }
  void moveRight (double dt) {
    position.add(Vector2(dt * _playerSpeed, 0));
  }

  ///あたり判定
  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    // if (other is WorldCollidable) {
    //   if (!_hasCollided) {
    //     _hasCollided = true;
    //     _collisionDirection = direction;
    //   }
    // }
    if (other is Circle) {
      if (!_hasCollided) {
        _hasCollided = true;
        isGameOver = true;
      }
    }
  }

  ///あたり判定解除
  @override
  void onCollisionEnd(Collidable other) {
    _hasCollided = false;
  }

  ///動けるかどうかの判定
  bool canPlayerMoveUp() {
    if (_hasCollided && _collisionDirection == Direction.up) {
      return false;
    }
    return true;
  }
  bool canPlayerMoveDown() {
    if (_hasCollided && _collisionDirection == Direction.down) {
      return false;
    }
    return true;
  }
  bool canPlayerMoveLeft() {
    if (_hasCollided && _collisionDirection == Direction.left) {
      return false;
    }
    return true;
  }
  bool canPlayerMoveRight() {
    if (_hasCollided && _collisionDirection == Direction.right) {
      return false;
    }
    return true;
  }

}
