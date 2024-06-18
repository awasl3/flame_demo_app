
// import 'package:flame/components.dart';
// import 'package:flame_demo_app/TowerDefensGame.dart';


// class LivesComponent extends SpriteAnimationComponent with HasGameReference<TowerDefenseGame> {
//   static int heartCount = 0;

//   LivesComponent({
//     required int heartCount,
//     required super.position,
//     required super.size,
//     super.scale,
//     super.angle,
//     super.anchor,
//     super.priority,
//   }) {
//     LivesComponent.heartCount = heartCount;
//   }

//   @override
//   Future<void> onLoad() async {
    
//   = await game.loadSprite(
//       'heart.png',
//       srcSize: Vector2.all(32),
//     );
//     await super.onLoad();
//   }

//   @override
//   void update(double dt) {
//     if (game.health < heartNumber) {
//       current = HeartState.unavailable;
//     } else {
//       current = HeartState.available;
//     }
//     super.update(dt);
//   }
// }