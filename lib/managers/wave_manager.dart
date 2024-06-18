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
  Wave([EnemySpawn(RadlerEnemy, 0, 9),EnemySpawn(RadlerEnemy, 1, 10)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 10),EnemySpawn(RadlerEnemy, 1, 11)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 11),EnemySpawn(RadlerEnemy, 1, 12)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 12),EnemySpawn(RadlerEnemy, 1, 15)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 13),EnemySpawn(RadlerEnemy, 1, 17)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 14),EnemySpawn(RadlerEnemy, 1, 19)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 15),EnemySpawn(RadlerEnemy, 1, 21)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 16),EnemySpawn(RadlerEnemy, 1, 21)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 17),EnemySpawn(RadlerEnemy, 1, 19)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 18),EnemySpawn(RadlerEnemy, 1, 10)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 19),EnemySpawn(RadlerEnemy, 1, 2)]),
  Wave([EnemySpawn(RadlerEnemy, 0, 20),EnemySpawn(RadlerEnemy, 1, 4)]),
];
