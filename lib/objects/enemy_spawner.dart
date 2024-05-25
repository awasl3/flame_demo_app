import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/enemys/enemy.dart';
import 'package:flame_demo_app/actors/enemys/radler_enemy.dart';
import 'package:flame_demo_app/managers/segment_manager.dart';
import 'package:flame_demo_app/managers/wave_manager.dart';
import 'package:flame_demo_app/objects/spawn_block.dart';
import 'package:flame_demo_app/objects/wave_calculator.dart';
import 'package:flutter/material.dart';

class EnemySpwaner extends Component with HasGameReference<TowerDefenseGame> {
  static List<Enemy> enemies = [];
  static List<SpawnBlock> spwans = [];

  static double waveDelay = 5;
  double nextWaveCounter = 0;

  static registerSpawner(SpawnBlock spawnBlock) {
    spwans.add(spawnBlock);
  }

  sendNextWave() async {
    Wave wave = WaveCalculator.getNextWave();

    for (EnemySpawn enemySpawn in wave.enemies) {
      for (int i = 0; i < enemySpawn.amount; i++) {
        SpawnBlock spawnBlock = spwans[enemySpawn.spwaner];
        switch (enemySpawn.enemyType) {
          case RadlerEnemy:
            double min = -16 + RadlerEnemy.componentSize.y / 2;
            double max = 16 - RadlerEnemy.componentSize.y / 2 - 5;
            double offset = Random().nextDouble() * (max - min) + min;
            Vector2 position = Vector2(spawnBlock.gridPosition.x,
                spawnBlock.gridPosition.y + (offset / 32));
            add(RadlerEnemy(
                gridPosition: position, spawnBlock: spawn[enemySpawn.spwaner]));
            await Future.delayed(
                Duration(milliseconds: Random().nextInt(100) + 20));
            break;
        }
      }
    }
  }

  @override
  void update(double dt) {
    nextWaveCounter += dt;
    if (nextWaveCounter >= waveDelay) {
      sendNextWave();
      nextWaveCounter = 0;
      waveDelay = double.infinity;
    }
    super.update(dt);
  }
}
