import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/enemys/enemy.dart';
import 'package:flame_demo_app/actors/tower/cannon/cannon.dart';

class Barrel extends SpriteComponent with HasGameReference<TowerDefenseGame> {
  Cannon cannon;

  Enemy? enemy;

  Barrel({
    required super.position,
    required this.cannon
  }) : super(size: Vector2(32,32), anchor: Anchor.center);

  @override
  void onLoad() {
    sprite = Sprite(game.images.fromCache('towers/cannon/barrel.png'));
  }

  
  @override
  void update(double dt) {
    if(enemy != null) {
      double theta =  getAngel(position, enemy!.position)  - pi/2;
      double max = cannon.rotationSpeed * dt * pi/180 - pi/2;
      angle = theta;
      
    }
    super.update(dt);
    
  }


  double getAngel(Vector2 a, Vector2 b) {
    double x = a.x - b.x;
    double y = a.y - b.y;
    return atan2(y, x);

  }

   
}