import 'dart:math';

import 'package:flame_demo_app/managers/wave_manager.dart';

class WaveCalculator {
  static int currentWaveIndex = 0;

  static Wave getNextWave() {
    Wave wave;
    if (currentWaveIndex < waves.length) {
      wave = waves[currentWaveIndex];
    } else {
      wave = calculateNewWave();
    }
    currentWaveIndex++;
    return wave;
  }

  static Wave calculateNewWave() {
    List<EnemySpawn> enemies = [];
    enemies.addAll(waves.last.enemies);
    double addition = sqrt(currentWaveIndex - waves.length);
    for (double i = 0; i < addition; i += 0.5) {
      enemies.addAll(waves[Random().nextInt(waves.length)].enemies);
    }
    return Wave(enemies);
  }
}
