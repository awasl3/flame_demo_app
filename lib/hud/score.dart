import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flutter/material.dart';

class ScoreDisplay extends SpriteComponent with HasGameReference<TowerDefenseGame> {
   static int score = 10;
   late TextComponent scoreTextComponent;
   double currentTime =0;

     ScoreDisplay({required super.position}) : super(size: Vector2(32, 32));


    @override
  Future<void> onLoad() async {
    scoreTextComponent = TextComponent(
      text: '${ScoreDisplay.score}',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 32,
          color: Color.fromRGBO(10, 10, 10, 1),
        ),
      ),
      anchor: Anchor.bottomLeft,
      //position: Vector2(position.x + score.toString().length * 32, position.y),
      position: Vector2(position.x -65 ,position.y-12)
    );
    add(scoreTextComponent);
    sprite = await game.loadSprite('hud/star.png');
    
  }

  @override
  void update(double dt) {
    currentTime+=dt;
    if(currentTime >= 5) {
      currentTime = 0;
      ScoreDisplay.score += 1;
    } 
    scoreTextComponent.text = '${ScoreDisplay.score}';
    //scoreTextComponent.position = Vector2(position.x -100 +ScoreDisplay.score.toString().length*32 ,position.y- 32);
  }
}