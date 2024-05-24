import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/enemys/enemy.dart';

class RadlerEnemy extends Enemy with HasGameReference<TowerDefenseGame> {
  Vector2 gridPosition;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 100;

  RadlerEnemy({
    required this.gridPosition,
  }) : super(size: Vector2(16, 32), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    final platformImage = game.images.fromCache('enemies/radler.png');
    sprite = Sprite(platformImage);
    position = Vector2(
      (gridPosition.x * 32),
      game.size.y - (gridPosition.y * 32),
    );
  }

  @override
  void update(double dt) {
    velocity.x = moveSpeed;
    position += velocity * dt;
    super.update(dt);
  }
}
