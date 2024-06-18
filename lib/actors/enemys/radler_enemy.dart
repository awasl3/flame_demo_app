import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/enemys/enemy.dart';
import 'package:flame_demo_app/actors/projectiles/missile.dart';
import 'package:flame_demo_app/actors/projectiles/projectile.dart';
import 'package:flame_demo_app/managers/segment_manager.dart' as prefix;
import 'package:flame_demo_app/managers/segment_manager.dart';
import 'package:flame_demo_app/objects/base_block.dart';
import 'package:flame_demo_app/objects/enemy_spawner.dart';
import 'package:flame_demo_app/objects/spawn_block.dart';
import 'package:flame_demo_app/util/pathfinding/path_finding.dart';

class RadlerEnemy extends Enemy with CollisionCallbacks, HasGameReference<TowerDefenseGame> {
  Vector2 gridPosition;
  prefix.Block spawnBlock;
  int currentBlock = 1;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 100;
  final List<Projectile> projectiles = [];
  static final componentSize = Vector2(8, 8);
  late final List<prefix.Block> path;

  RadlerEnemy({required this.gridPosition, required this.spawnBlock})
      : super(size: RadlerEnemy.componentSize, anchor: Anchor.bottomLeft);


    @override
void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
  print("Collision");
  if (other is Missile) {
    if((other as Missile).target == this) {
          destoryEnemy();
    }

  }

  super.onCollision(intersectionPoints, other);
}

  @override
  void onLoad() {
    final platformImage = game.images.fromCache('enemies/radler.png');
    sprite = Sprite(platformImage);
    position = Vector2(
      (gridPosition.x * 32),
      game.size.y - (gridPosition.y * 32),
    );
    setPathToFollow();

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    if (currentBlock < path.length) {
      Vector2 currentTargetPos =
          blockPositionToVector(path[currentBlock].gridPosition);

      Vector2 nextTargetPos = blockPositionToVector(path[
              (currentBlock + 1) < path.length
                  ? (currentBlock + 1)
                  : currentBlock]
          .gridPosition);

      double lookaheadDistance = 4.0;
      Vector2 smoothTargetPos = currentTargetPos +
          (nextTargetPos - currentTargetPos).normalized() * lookaheadDistance;
      moveToPosition(smoothTargetPos, dt);
      checkIfBlockReached();
    } else {
      destoryEnemy();
    }
    super.update(dt);
  }

  void moveToPosition(Vector2 targetPosition, double dt) {
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
    if ((position - next).length <= 12) {
      currentBlock++;
    }
  }

  Vector2 blockPositionToVector(Vector2 blockPosition) {
    return Vector2(
      (blockPosition.x * 32),
      game.size.y - (blockPosition.y * 32),
    );
  }

  void setPathToFollow() {
    List<prefix.Block> blocks =
        List.from(PathFinder.getBestPath(RadlerEnemy, spawnBlock, base[0]));
    double xDirection =
        blocks.last.gridPosition.x - blocks[blocks.length - 2].gridPosition.x;
    double yDirection =
        blocks.last.gridPosition.y - blocks[blocks.length - 2].gridPosition.y;
    blocks.add(prefix.Block(
        Vector2((blocks.last.gridPosition.x + xDirection / 2),
            (blocks.last.gridPosition.y + yDirection / 2)),
        BaseBlock));

    Vector2 offset = Vector2.random() - Vector2.all(0.2) / 3;
    path = [];
    for (var element in blocks) {
      path.add(prefix.Block(element.gridPosition + offset, element.blockType));
    }
  }

  @override
  addProjectile(Projectile projectile) {
    projectiles.add(projectile);
  }

  @override
  destoryEnemy() {
    removeFromParent();
    EnemySpwaner.enemies.remove(this);
    for (Projectile element in projectiles) {
      element.destroyProjectile();
    }
  }
}
