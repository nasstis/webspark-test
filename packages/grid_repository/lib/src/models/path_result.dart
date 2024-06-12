import 'package:grid_repository/grid_repository.dart';

class PathResult {
  final String path;
  final List<Coordinate> steps;

  PathResult({
    required this.path,
    required this.steps,
  });

  PathResultEntity toEntiy() {
    return PathResultEntity(
      path: path,
      steps: steps,
    );
  }
}
