import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/enemys/enemy.dart';
import 'package:flame_demo_app/actors/enemys/radler_enemy.dart';
import 'package:flame_demo_app/actors/tower/cannon/cannon.dart';
import 'package:flame_demo_app/hud/lives.dart';
import 'package:flame_demo_app/hud/money.dart';
import 'package:flame_demo_app/managers/segment_manager.dart';
import 'package:flame_demo_app/managers/wave_manager.dart';
import 'package:flame_demo_app/objects/spawn_block.dart';
import 'package:flame_demo_app/objects/wave_calculator.dart';
import 'package:flutter/material.dart';

class TowerBuilder extends Component with HasGameReference<TowerDefenseGame> {
  static List<Cannon> towers = [];

  static List<Vector2> toBeBuilded = [];

  buildTower() async {
    if(HeartDisplay.lives > 0) {
      toBeBuilded.forEach((element) {
        if(!towers.any((t) =>t.gridPosition == element )) {
          if(MoneyDisplay.money >= 100) {
            Cannon cannon = Cannon(gridPosition: element);
            towers.add(cannon);
            add(cannon);
            MoneyDisplay.money -= 100;
          }
          
        }
        
      });
      toBeBuilded = [];
    }
  }

 
  @override
  void update(double dt) {
    if(toBeBuilded.isNotEmpty) {
      buildTower();
    }
    super.update(dt);
  }
}
