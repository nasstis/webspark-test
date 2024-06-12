import 'package:grid_repository/src/entities/entities.dart';
import 'package:grid_repository/src/models/coordinate.dart';

class GridData {
  final String id;
  final List<List<String>> field;
  final Coordinate start;
  final Coordinate end;

  GridData({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  static GridData fromEntity(GridDataEntity entity) {
    return GridData(
      id: entity.id,
      field: entity.field,
      start: entity.start,
      end: entity.end,
    );
  }
}
