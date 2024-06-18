import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
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

    // _scoreTextComponent = TextComponent(
    //   text: '${Hud.score}',
    //   textRenderer: TextPaint(
    //     style: const TextStyle(
    //       fontSize: 32,
    //       color: Color.fromRGBO(10, 10, 10, 1),
    //     ),
    //   ),
    //   anchor: Anchor.center,
    //   position: Vector2(100 + score.toString().length * 32, 50),
    // );
    // add(_scoreTextComponent);

    // final starSprite = await game.loadSprite('hud/star.png');
    // add(
    //   SpriteComponent(
    //     sprite: starSprite,
    //     position: Vector2(100, 50),
    //     size: Vector2.all(32),
    //     anchor: Anchor.center,
    //   ),
    // );
  }


}