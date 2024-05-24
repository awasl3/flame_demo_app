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
  Wave([EnemySpawn(RadlerEnemy, 0, 1)])
];
