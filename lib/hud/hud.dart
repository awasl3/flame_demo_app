import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/hud/lives.dart';
import 'package:flame_demo_app/hud/money.dart';
import 'package:flame_demo_app/hud/score.dart';
import 'package:flutter/material.dart';


class Hud extends PositionComponent with HasGameReference<TowerDefenseGame> {


  Hud({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority = 5,
  });

  @override
  Future<void> onLoad() async {
    add(ScoreDisplay(position: Vector2(100, 50)));
    add(HeartDisplay(position: Vector2(100, 90)));
    add(MoneyDisplay(position: Vector2(100,130)));
  }


}