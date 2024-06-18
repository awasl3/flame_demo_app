import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

abstract class Projectile extends SpriteComponent {
  Projectile({required Vector2 size, required Anchor anchor,required Vector2 position})
      : super(size: size, anchor: anchor,position: position);


  destroyProjectile();
}