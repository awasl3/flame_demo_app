import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_demo_app/actors/projectiles/missile.dart';
import 'package:flame_demo_app/actors/projectiles/projectile.dart';
import 'package:flame_demo_app/objects/base_block.dart';

abstract class Enemy extends SpriteComponent {
  Enemy({required Vector2 size, required Anchor anchor})
      : super(size: size, anchor: Anchor.bottomLeft);


  addProjectile(Projectile projectile);
  destoryEnemy(bool killed);
}
