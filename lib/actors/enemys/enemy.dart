import 'package:flame/components.dart';

abstract class Enemy extends SpriteComponent {
  Enemy({required Vector2 size, required Anchor anchor})
      : super(size: Vector2.all(32), anchor: Anchor.bottomLeft);
}
