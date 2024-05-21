import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';

class PathBlock extends SpriteComponent
    with HasGameReference<TowerDefenseGame> {
  final Vector2 gridPosition;

  PathBlock({
    required this.gridPosition,
  }) : super(size: Vector2.all(32), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    final platformImage = game.images.fromCache('levels/path.png');
    sprite = Sprite(platformImage);
    position = Vector2(
      (gridPosition.x * size.x),
      game.size.y - (gridPosition.y * size.y),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
