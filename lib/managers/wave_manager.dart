import 'package:flame_demo_app/actors/enemys/radler_enemy.dart';

class Wave {
  final List<EnemySpawn> enemies;
  Wave(this.enemies);
}

class EnemySpawn {
  final Type enemyType;
  final int spwaner;
  final int amount;
  EnemySpawn(this.enemyType, this.spwaner, this.amount);
}

final waves = [
  Wave([EnemySpawn(RadlerEnemy, 0, 1)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 2)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 3)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 4)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 5)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 6)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 7)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 8)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 9)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 10)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 11)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 12)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 13)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 14)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 15)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 16)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 17)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 18)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 19)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 20)]),
];
