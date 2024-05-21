import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flutter/widgets.dart';
import 'package:flame_tiled/flame_tiled.dart';

void main() {
  runApp(
    const GameWidget<TowerDefenseGame>.controlled(
      gameFactory: TowerDefenseGame.new,
    ),
  );
}
