import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/overlay/game_over.dart';
import 'package:flame_demo_app/overlay/main_menu.dart';
import 'package:flutter/widgets.dart';
import 'package:flame_tiled/flame_tiled.dart';

void main() {
  runApp(
    GameWidget<TowerDefenseGame>.controlled(
      gameFactory: TowerDefenseGame.new,
       overlayBuilderMap: {
        'MainMenu': (context, game) => MainMenu(game: game),
        'GameOver': (context, game) => GameOver(game: game),
      },
      initialActiveOverlays: const ['MainMenu'],
    ),
  );
}
