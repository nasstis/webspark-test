import 'package:grid_repository/grid_repository.dart';

class PathResultEntity {
  final String path;
  final List<Coordinate> steps;

  PathResultEntity({
    required this.path,
    required this.steps,
  });

  Map<String, dynamic> toJson() {
    return {
      "steps": steps.map((e) => e.toEntity().toJson()).toList(),
      "path": path
    };
  }
}
