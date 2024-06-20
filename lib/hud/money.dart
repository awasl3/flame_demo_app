import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flutter/material.dart';

class MoneyDisplay extends SpriteComponent with HasGameReference<TowerDefenseGame> {
  static int money = 110;
  late TextComponent moneyTextComponent;
  double currentTime =0;

  MoneyDisplay({required super.position}) : super(size: Vector2(32, 32));


  @override
  Future<void> onLoad() async {
    moneyTextComponent = TextComponent(
      text: '${MoneyDisplay.money}',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 32,
          color: Color.fromRGBO(10, 10, 10, 1),
        ),
      ),
      anchor: Anchor.bottomLeft,
      position: Vector2(position.x -65 ,position.y-95)
    );
    add(moneyTextComponent);
    sprite = await game.loadSprite('hud/coins.png');
    
  }

  @override
  void update(double dt) {
    if(game.started) {
      currentTime += dt;
      if(currentTime >= 5) {
        MoneyDisplay.money += 10;
        currentTime = 0;
      }
    }
    moneyTextComponent.text = "${MoneyDisplay.money}";
  }
}