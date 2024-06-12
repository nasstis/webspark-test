import 'dart:collection';

import 'package:grid_repository/grid_repository.dart';

const List<List<Coordinate>> directions = [
  [
    Coordinate(x: 1, y: 0),
    Coordinate(x: -1, y: 0)
  ], // Horizontal movement direction
  [
    Coordinate(x: 0, y: 1),
    Coordinate(x: 0, y: -1)
  ], // Vertical movement direction
  [
    Coordinate(x: 1, y: 1),
    Coordinate(x: -1, y: -1)
  ], // Diagonal \ movement direction
  [
    Coordinate(x: 1, y: -1),
    Coordinate(x: -1, y: 1)
  ], // Diagonal / movement direction
];

List<Coordinate> findShortestPath(
    List<List<String>> grid, Coordinate start, Coordinate end) {
  int n = grid.length;

  Queue<List<Coordinate>> queue = Queue();
  queue.add([start]);
  Set<Coordinate> visited = {start};

  while (queue.isNotEmpty) {
    List<Coordinate> path = queue.removeFirst();
    Coordinate current = path.last;

    if (current == end) {
      return path;
    }

    for (List<Coordinate> dir in directions) {
      for (Coordinate d in dir) {
        Coordinate next = Coordinate(x: current.x + d.x, y: current.y + d.y);
        if (next.x >= 0 &&
            next.x < n &&
            next.y >= 0 &&
            next.y < n &&
            grid[next.x][next.y] != 'X' &&
            !visited.contains(next)) {
          visited.add(next);
          List<Coordinate> newPath = List.from(path);
          newPath.add(next);
          queue.add(newPath);
        }
      }
    }
  }

  return [];
}
