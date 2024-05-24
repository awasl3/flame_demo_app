import 'dart:collection';

import 'package:flame/components.dart';
import 'package:flame_demo_app/actors/enemys/enemy.dart';
import 'package:flame_demo_app/managers/segment_manager.dart' as prefix;

class PathFinder {
  static Map<Type, Map<Vector2, List<Vector2>>> paths = {};

  static List<Vector2> getBestPath(Type enemyType, Vector2 spawn, Vector2 end) {
    if (enemyType != Enemy) {
      throw Exception("Not an enemy");
    }

    if (paths.containsKey(enemyType)) {
      Map<Vector2, List<Vector2>> possiblePaths = paths[enemyType]!;
      if (possiblePaths.containsKey(spawn)) {
        return possiblePaths[spawn]!;
      } else {
        print("Spawn does not exist");
        List<Vector2> newPath = aStar(prefix.path, spawn, end);
        possiblePaths.putIfAbsent(spawn, () => newPath);
        paths.update(enemyType, (value) => possiblePaths);
      }
    } else {
      print("Enemy type does not exist");
      List<Vector2> newPath = aStar(prefix.path, spawn, end);
      Map<Vector2, List<Vector2>> spawnToBase = {};
      spawnToBase.putIfAbsent(spawn, () => newPath);
      paths.putIfAbsent(enemyType, () => spawnToBase);
    }
  }

  static List<Vector2> aStar(
      List<prefix.Block> path, Vector2 spawn, Vector2 end) {}
}
