import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_demo_app/actors/projectiles/missile.dart';
import 'package:flame_demo_app/actors/projectiles/projectile.dart';
import 'package:flame_demo_app/objects/base_block.dart';

abstract class Enemy extends SpriteComponent  with CollisionCallbacks {
  final double moveSpeed;
  final List<Projectile> projectiles = [];
  Enemy({required Vector2 size, required Anchor anchor, required this.moveSpeed})
      : super(size: size, anchor: Anchor.bottomLeft);


  addProjectile(Projectile projectile);

  
  destoryEnemy(bool killed);



     @override
void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
  if(other is BaseBlock){
      destoryEnemy(false);
  } else if (other is Missile) {
    if((other as Missile).target == this) {
          destoryEnemy(true);
    }
  }
  super.onCollision(intersectionPoints, other);
}
}
