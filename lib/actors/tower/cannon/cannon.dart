import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/enemys/enemy.dart';
import 'package:flame_demo_app/actors/tower/cannon/barrel.dart';
import 'package:flame_demo_app/actors/tower/cannon/base.dart';
import 'package:flame_demo_app/objects/enemy_spawner.dart';

class Cannon extends Component with HasGameReference<TowerDefenseGame> {
  late Base base;
  late Barrel barrel;
  Enemy? target;
  late Vector2 position;
  int range = 100000;
  int damage = 10;
  int attackspeed = 1;
  int rotationSpeed = 180;
  final Vector2 gridPosition;
  Cannon({
    required this.gridPosition,
  }) : super();

  @override
  void onLoad() {
     position = Vector2(
      (gridPosition.x * 32),
      game.size.y - (gridPosition.y * 32),
    );
    base =  Base(position: position,cannon:this);
    add(base);
    barrel =  Barrel(position: Vector2(position.x + 16, position.y - 16),cannon:this);
    add(barrel);
  }

  @override
  void update(double dt) {
    target = getNearestEnemy();
    barrel.enemy = target;
    super.update(dt);
    
  }


  Enemy? getNearestEnemy() {
    List<Enemy> enemies = List.from(EnemySpwaner.enemies);
    return enemies.where((enemy) => distance(enemy) < range).firstOrNull;
  }


  double distance(Enemy enemy) {
    return position.distanceTo(enemy.position);
  }

 
}
