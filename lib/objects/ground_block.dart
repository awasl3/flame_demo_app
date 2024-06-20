import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/tower/cannon/cannon.dart';
import 'package:flame_demo_app/objects/tower_builder.dart';

class GroundBlock extends SpriteComponent
    with TapCallbacks, HasGameReference<TowerDefenseGame> {
  final Vector2 gridPosition;

  Cannon? tower;
  bool tapped = false;

  GroundBlock({
    required this.gridPosition,
  }) : super(size: Vector2.all(32), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    final platformImage = game.images.fromCache('levels/ground.png');
    sprite = Sprite(platformImage);
    position = Vector2(
      (gridPosition.x * size.x),
      game.size.y - (gridPosition.y * size.y),
    );
  }


  @override
  void onTapDown(TapDownEvent event) async {
    TowerBuilder.toBeBuilded.add(gridPosition);
  }




 

  @override
  void update(double dt) {
    if(tower != null && tapped == true) {
      tower = Cannon(gridPosition: gridPosition);
      add(tower!);
    }
    super.update(dt);
  }
}
