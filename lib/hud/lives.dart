import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flutter/material.dart';

class HeartDisplay extends SpriteComponent with HasGameReference<TowerDefenseGame> {
   static int lives = 0;
   late TextComponent scoreTextComponent;

  HeartDisplay({required super.position}) : super(size: Vector2(32, 32),anchor: Anchor.topLeft);


    @override
  Future<void> onLoad() async {
    sprite = await game.loadSprite('hud/heart.png');
    scoreTextComponent = TextComponent(
      text: '${HeartDisplay.lives}',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 32,
          color: Color.fromRGBO(10, 10, 10, 1),
        ),
      ),
      anchor: Anchor.centerLeft,
      position: Vector2(position.x -65 ,position.y- 75)
    );
    add(scoreTextComponent);
  
    
  }

  @override
  void update(double dt) {
    scoreTextComponent.text = '${HeartDisplay.lives}';
  }

  static void subtract(int i) {
    HeartDisplay.lives -= i;
    HeartDisplay.lives = HeartDisplay.lives.isNegative ? 0 : HeartDisplay.lives;
  }
}