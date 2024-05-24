import 'package:flame/components.dart';

abstract class Enemy extends SpriteComponent {
  Enemy({required Vector2 size, required Anchor anchor})
      : super(size: size, anchor: Anchor.bottomLeft);
}
