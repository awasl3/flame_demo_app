import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_demo_app/actors/tower/cannon/cannon.dart';
import 'package:flame_demo_app/hud/hud.dart';
import 'package:flame_demo_app/hud/lives.dart';
import 'package:flame_demo_app/hud/score.dart';
import 'package:flame_demo_app/managers/segment_manager.dart';
import 'package:flame_demo_app/objects/base_block.dart';
import 'package:flame_demo_app/objects/enemy_spawner.dart';
import 'package:flame_demo_app/objects/ground_block.dart';
import 'package:flame_demo_app/objects/path_block.dart';
import 'package:flame_demo_app/objects/spawn_block.dart';
import 'package:flame_demo_app/objects/tower_builder.dart';
import 'package:flame_demo_app/objects/wave_calculator.dart';

class TowerDefenseGame extends FlameGame with HasCollisionDetection {
  TowerDefenseGame();
  late Cannon cannon;
  bool started = false;

  @override
  Color backgroundColor() {
    return const Color.fromARGB(200, 200, 200, 247);
  }

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'levels/base.png',
      'levels/ground.png',
      'levels/path.png',
      'levels/spawn.png',
      'towers/cannon/base.png',
      'towers/cannon/barrel.png',
      'enemies/radler.png',
      'projectiles/missile.png',
      'hud/heart.png'
    ]);
    camera.viewfinder.anchor = Anchor.topLeft;
    initializeGameBoard();
    ScoreDisplay.score = 0;
    HeartDisplay.lives = 50;
    addHud();
    
  }


  void startGame(){
      ScoreDisplay.score = 0;
      HeartDisplay.lives = 50;
      add(EnemySpwaner());
      add(TowerBuilder());
      started = true;

  }

  void initializeGameBoard() {
    for (var i = 0; i < segments.length; i++) {
      loadGameSegments(i);
    }
  }

  void loadGameSegments(int segmentIndex) {
    for (final block in segments[segmentIndex]) {
      print(block.blockType);
      switch (block.blockType) {
        case PathBlock:
          add(PathBlock(
            gridPosition: block.gridPosition,
          ));
          break;
        case SpawnBlock:
          add(SpawnBlock(
            gridPosition: block.gridPosition,
          ));
          break;
        case GroundBlock:
          add(GroundBlock(
            gridPosition: block.gridPosition,
          ));
          //add(Cannon(gridPosition: block.gridPosition));
          break;
        case BaseBlock:
          add(BaseBlock(
            gridPosition: block.gridPosition,
          ));
          break;
      }
    }
  }
  



  void addHud() {
    camera.viewport.add(Hud());
  }

  void reset() {
    TowerBuilder.toBeBuilded = [];
    TowerBuilder.towers.forEach((element) {
      element.removeFromParent();
    });
    EnemySpwaner.enemies = [];
    TowerBuilder.towers = [];
    WaveCalculator.currentWaveIndex = 0;
    startGame();
  }


  @override
  void update(double dt) {
  if (HeartDisplay.lives <= 0) {
    overlays.add('GameOver');
    started = false;
  }
  super.update(dt);
}
}
