import 'dart:collection';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_demo_app/actors/enemys/enemy.dart';
import 'package:flame_demo_app/managers/segment_manager.dart' as prefix;
import 'package:flame_demo_app/util/pathfinding/graph.dart';
import 'package:flame_demo_app/util/pathfinding/route_node.dart';
import 'package:collection/collection.dart';

class PathFinder {
  static Map<Type, Map<prefix.Block, List<prefix.Block>>> paths = {};

  static List<prefix.Block> getBestPath(
      Type enemyType, prefix.Block spawn, prefix.Block end) {
    if (enemyType is Enemy) {
      throw Exception("Not an enemy");
    }

    if (paths.containsKey(enemyType)) {
      Map<prefix.Block, List<prefix.Block>> possiblePaths = paths[enemyType]!;
      if (possiblePaths.containsKey(spawn)) {
        return possiblePaths[spawn]!;
      } else {
        print("Spawn does not exist");
        List<prefix.Block> newPath = aStar(prefix.path, spawn, end);
        possiblePaths.putIfAbsent(spawn, () => newPath);
        paths.update(enemyType, (value) => possiblePaths);
        return newPath;
      }
    } else {
      print("Enemy type does not exist");
      List<prefix.Block> newPath = aStar(prefix.path, spawn, end);
      Map<prefix.Block, List<prefix.Block>> spawnToBase = {};
      spawnToBase.putIfAbsent(spawn, () => newPath);
      paths.putIfAbsent(enemyType, () => spawnToBase);
      return newPath;
    }
  }

  static List<prefix.Block> aStar(
      List<prefix.Block> path, prefix.Block spawn, prefix.Block end) {
    Graph graph = Graph(prefix.path, prefix.base, prefix.spawn, prefix.ground);
    PriorityQueue<RouteNode> openSet = PriorityQueue();
    Map<prefix.Block, RouteNode> allNodes = {};
    RouteNode start = RouteNode(
        current: spawn,
        previous: null,
        routeScore: 0,
        estimatedScore: distance(spawn, end));
    openSet.add(start);
    allNodes.putIfAbsent(spawn, () => start);

    while (openSet.isNotEmpty) {
      RouteNode next = openSet.removeFirst();
      if (next.current == end) {
        List<prefix.Block> route = [];
        RouteNode? current = next;
        do {
          route.insert(0, current!.current);
          current = allNodes[current.previous];
        } while (current != null);
        return route;
      }

      for (prefix.Block neighbour in graph.getNeighbours(next.current)) {
        RouteNode nextNode = allNodes.containsKey(neighbour)
            ? allNodes[neighbour]!
            : RouteNode.build(neighbour);

        allNodes.update(neighbour, (value) => nextNode,
            ifAbsent: () => nextNode);
        double score = next.routeScore + distance(next.current, neighbour);
        if (score < nextNode.routeScore) {
          nextNode.previous = next.current;
          nextNode.routeScore = score;
          nextNode.estimatedScore = score + distance(neighbour, end);
          openSet.add(nextNode);
        }
      }
    }
    throw Exception("No route found");
  }

  static double distance(prefix.Block from, prefix.Block to) {
    double x = from.gridPosition.x - to.gridPosition.x;
    double y = from.gridPosition.y - to.gridPosition.y;

    return sqrt(x * x + y * y);
  }
}
