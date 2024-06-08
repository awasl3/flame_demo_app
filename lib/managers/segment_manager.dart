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
  Block(Vector2(4, 4), PathBlock),
  Block(Vector2(5, 4), PathBlock),
  Block(Vector2(6, 4), PathBlock),
  Block(Vector2(7, 4), PathBlock),
  Block(Vector2(8, 4), PathBlock),
  Block(Vector2(8, 5), PathBlock),
  Block(Vector2(8, 6), PathBlock),
  Block(Vector2(8, 7), PathBlock),
  Block(Vector2(9, 7), PathBlock),
  Block(Vector2(9, 8), PathBlock),
  Block(Vector2(10, 8), PathBlock),
  Block(Vector2(11, 8), PathBlock),
  Block(Vector2(12, 8), PathBlock),
  Block(Vector2(13, 8), PathBlock),
  Block(Vector2(13, 9), PathBlock),
];

final base = [
  Block(Vector2(14, 9), BaseBlock),
];
final spawn = [
  Block(Vector2(3, 4), SpawnBlock),
];
final ground = [
  Block(Vector2(10, 7), GroundBlock),
];
