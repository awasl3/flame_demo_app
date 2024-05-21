import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';

class Cannon extends SpriteComponent with HasGameReference<TowerDefenseGame> {
  Cannon({
    required super.position,
  }) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  void onLoad() {
    sprite = Sprite(game.images.fromCache('towers/cannon.png'));
  }
}
