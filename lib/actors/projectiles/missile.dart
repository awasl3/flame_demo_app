
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/enemys/enemy.dart';
import 'package:flame_demo_app/actors/projectiles/projectile.dart';
import 'package:flame_demo_app/actors/tower/cannon/barrel.dart';

class Missile extends Projectile with HasGameReference<TowerDefenseGame> {
 Enemy target;
 double speed;

  Missile({
    required super.position,
    required this.target, required this.speed,
  }) : super(size: Vector2(16,16), anchor: Anchor.center);

  @override
  void onLoad() {
    sprite = Sprite(game.images.fromCache('projectiles/missile.png'));
    target.addProjectile(this);
    add(RectangleHitbox(collisionType: CollisionType.passive));
  }

  
  @override
  void update(double dt) {
      double theta =  getAngel(position, target.position)  - pi/2;
      angle = theta;
      Vector2 heading = Vector2(cos(angle), sin(angle));
      position.moveToTarget(target.position, dt*speed);
      super.update(dt);
    
  }


  double getAngel(Vector2 a, Vector2 b) {
    double x = a.x - b.x;
    double y = a.y - b.y;
    return atan2(y, x);
  }
  
  @override
  destroyProjectile() {
    removeFromParent();
  }

   
}