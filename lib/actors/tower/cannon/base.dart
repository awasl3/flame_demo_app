
import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/tower/cannon/cannon.dart';

class Base extends SpriteComponent with HasGameReference<TowerDefenseGame>{
Cannon cannon;

Base({
    required super.position,
    required this.cannon
  }) : super(size: Vector2.all(32), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    sprite = Sprite(game.images.fromCache('towers/cannon/base.png'));
  }
}