import 'dart:ui';

import 'package:finding_path/utils/constants/colors.dart';
import 'package:grid_repository/grid_repository.dart';

Color getFieldColor(int i, int j, List<List<String>> field, Coordinate start,
    Coordinate end, List<Coordinate> steps) {
  if (start.x == i && start.y == j) {
    return MyColors.startPoint;
  }
  if (end.x == i && end.y == j) {
    return MyColors.endPoint;
  }
  if (steps.contains(Coordinate(x: i, y: j))) {
    return MyColors.shortestPath;
  }
  if (field[j][i] == 'X') {
    return MyColors.blockedPoint;
  }
  return MyColors.emptyPoint;
}
