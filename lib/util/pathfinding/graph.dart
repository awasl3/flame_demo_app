import 'dart:math';

import '../../managers/segment_manager.dart';

class Graph {
  late final Set<Block> nodes;
  late final Map<Block, Set<Block>> edges;

  Graph(List<Block> path, List<Block> base, List<Block> spawn,
      List<Block> ground) {
    nodes = {};
    nodes.addAll(path);
    nodes.addAll(base);
    nodes.addAll(spawn);
    //nodes.addAll(ground);
    edges = {};

    for (Block centerNode in nodes) {
      Set<Block> neighbours = {};
      for (Block node in nodes) {
        if (areNeighbours(centerNode, node)) {
          neighbours.add(node);
        }
      }
      edges.putIfAbsent(centerNode, () => neighbours);
    }
  }

  bool areNeighbours(Block center, Block other) {
    return (center.gridPosition.x == other.gridPosition.x &&
            center.gridPosition.y + 1 == other.gridPosition.y) ||
        (center.gridPosition.x == other.gridPosition.x &&
            center.gridPosition.y - 1 == other.gridPosition.y) ||
        (center.gridPosition.y == other.gridPosition.y &&
            center.gridPosition.x + 1 == other.gridPosition.x) ||
        (center.gridPosition.y == other.gridPosition.y &&
            center.gridPosition.x - 1 == other.gridPosition.x);
  }

  Set<Block> getNeighbours(Block node) {
    return edges[node]!;
  }
}
