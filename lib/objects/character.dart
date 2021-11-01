import 'package:firstgame/entities/direction.dart';
import 'package:firstgame/objects/circle.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';

class Character extends SpriteComponent with HasGameRef, Hitbox, Collidable {
  Character()
      : super(
          size: Vector2.all(80.0),
        ) {
    anchor = Anchor.center;
    addHitbox(HitboxRectangle(relation: Vector2.all(0.8)));
  }

  final double _playerSpeed = 150.0;
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
      gameSize.y / 5.0 * 5.0 - 50,
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
  void update(double delta) {
    super.update(delta);
    moveCharacter(delta);
  }

  void moveCharacter(double delta) {
    switch (direction) {
      case Direction.up:
        if (canPlayerMoveUp()) {
          moveUp(delta);
        }
        break;
      case Direction.down:
        if (canPlayerMoveDown()) {
          moveDown(delta);
        }
        break;
      case Direction.left:
        if (canPlayerMoveLeft()) {
          moveLeft(delta);
        }
        break;
      case Direction.right:
        if (canPlayerMoveRight()) {
          moveRight(delta);
        }
        break;
      case Direction.none:
        break;
    }
  }

  void moveUp (double delta) {
    position.add(Vector2(0, delta * _playerSpeed * (-1)));
  }
  void moveDown (double delta) {
    position.add(Vector2(0, delta * _playerSpeed));
  }
  void moveLeft (double delta) {
    position.add(Vector2(delta * _playerSpeed * (-1), 0));
  }
  void moveRight (double delta) {
    position.add(Vector2(delta * _playerSpeed, 0));
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
    if (other is MyCircle) {
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
    isGameOver = false;
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