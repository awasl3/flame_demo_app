import 'package:flame/components.dart';
import 'package:flame_demo_app/TowerDefensGame.dart';
import 'package:flame_demo_app/actors/tower/cannon/barrel.dart';
import 'package:flame_demo_app/actors/tower/cannon/base.dart';

class Cannon extends Component with HasGameReference<TowerDefenseGame> {
  late Base base;
  late Barrel barrel;
  final Vector2 gridPosition;
  Cannon({
    required this.gridPosition,
  }) : super();

  @override
  void onLoad() {
    Vector2 position = Vector2(
      (gridPosition.x * 32),
      game.size.y - (gridPosition.y * 32),
    );
    base =  Base(position: position,cannon:this);
    add(base);
    barrel =  Barrel(position: position,cannon:this);
    add(barrel);
  }
}
