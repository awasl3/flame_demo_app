import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/enemys/enemy.dart';
import 'package:flame_demo_app/managers/segment_manager.dart' as prefix;
import 'package:flame_demo_app/managers/segment_manager.dart';
import 'package:flame_demo_app/objects/spawn_block.dart';
import 'package:flame_demo_app/util/pathfinding/path_finding.dart';

class RadlerEnemy extends Enemy with HasGameReference<TowerDefenseGame> {
  Vector2 gridPosition;
  prefix.Block spawnBlock;
  int currentBlock = 1;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 100;
  static final componentSize = Vector2(8, 16);
  late final List<prefix.Block> path;

  RadlerEnemy({required this.gridPosition, required this.spawnBlock})
      : super(size: RadlerEnemy.componentSize, anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    final platformImage = game.images.fromCache('enemies/radler.png');
    sprite = Sprite(platformImage);
    position = Vector2(
      (gridPosition.x * 32),
      game.size.y - (gridPosition.y * 32),
    );
    path = PathFinder.getBestPath(RadlerEnemy, spawnBlock, base[0]);
  }

  @override
  void update(double dt) {
    if (currentBlock < path.length) {
      moveToBlock(path[currentBlock], dt);
      checkIfBlockReached();
    }
    super.update(dt);
  }

  void moveToBlock(prefix.Block targetBlock, double dt) {
    Vector2 targetPosition = Vector2(
      (targetBlock.gridPosition.x * 32),
      game.size.y - (targetBlock.gridPosition.y * 32),
    );
    Vector2 direction = targetPosition - position;
    if (direction.length > moveSpeed * dt) {
      direction.normalize();
      velocity.setFrom(direction * moveSpeed);
    } else {
      velocity.setFrom(direction / dt);
    }
    position += velocity * dt;
  }

  void checkIfBlockReached() {
    Vector2 next = Vector2((path[currentBlock].gridPosition.x * 32),
        game.size.y - (path[currentBlock].gridPosition.y * 32));
    print((position - next).length);
    if ((position - next).length == 0) {
      currentBlock++;
    }
  }
}
