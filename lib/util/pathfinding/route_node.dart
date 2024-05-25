import 'package:flame_demo_app/managers/segment_manager.dart';

class RouteNode implements Comparable<RouteNode> {
  final Block current;
  Block? previous;
  double routeScore;
  double estimatedScore;

  RouteNode(
      {required this.current,
      required this.previous,
      required this.routeScore,
      required this.estimatedScore});
  @override
  int compareTo(RouteNode other) {
    if (estimatedScore > other.estimatedScore) {
      return 1;
    } else if (estimatedScore < other.estimatedScore) {
      return -1;
    } else {
      return 0;
    }
  }

  static build(Block neighbour) {
    return RouteNode(
        current: neighbour,
        previous: null,
        routeScore: double.maxFinite,
        estimatedScore: double.maxFinite);
  }
}
