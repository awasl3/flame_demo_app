import 'package:flame/game.dart';
import 'package:flame_demo_app/objects/base_block.dart';
import 'package:flame_demo_app/objects/ground_block.dart';
import 'package:flame_demo_app/objects/path_block.dart';
import 'package:flame_demo_app/objects/spawn_block.dart';

class Block {
  final Vector2 gridPosition;
  final Type blockType;
  Block(this.gridPosition, this.blockType);
}

final segments = [path, base, spawn, ground];

final path = [
  Block(Vector2(1, 0), PathBlock),
  Block(Vector2(2, 0), PathBlock),
  Block(Vector2(3, 0), PathBlock),
  Block(Vector2(4, 0), PathBlock),
  Block(Vector2(5, 0), PathBlock),
  Block(Vector2(5, 1), PathBlock),
  Block(Vector2(5, 2), PathBlock),
  Block(Vector2(5, 3), PathBlock),
  Block(Vector2(6, 3), PathBlock),
  Block(Vector2(7, 3), PathBlock),
  Block(Vector2(8, 3), PathBlock),
  Block(Vector2(9, 3), PathBlock),
  Block(Vector2(10, 3), PathBlock),
  Block(Vector2(10, 4), PathBlock),
  Block(Vector2(11, 4), PathBlock),
];

final base = [
  Block(Vector2(11, 4), BaseBlock),
];
final spawn = [
  Block(Vector2(0, 0), SpawnBlock),
];
final ground = [
  Block(Vector2(11, 3), GroundBlock),
];
