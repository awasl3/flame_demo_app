import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/tower/cannon/cannon.dart';

class Barrel extends SpriteComponent with HasGameReference<TowerDefenseGame> {
  Cannon cannon;

  Barrel({
    required super.position,
    required this.cannon
  }) : super(size: Vector2.all(32), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    sprite = Sprite(game.images.fromCache('towers/cannon/barrel.png'));
  }
}