import 'package:grid_repository/src/entities/entities.dart';

import '../models/models.dart';

class GridDataEntity {
  final String id;
  final List<List<String>> field;
  final Coordinate start;
  final Coordinate end;

  GridDataEntity({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  static GridDataEntity fromJson(Map<String, dynamic> doc) {
    return GridDataEntity(
      id: doc['id'],
      field: List<List<String>>.from(doc['field'].map((row) => row.split(''))),
      start: Coordinate.fromEntity(CoordinateEntity.fromJson(doc['start'])),
      end: Coordinate.fromEntity(CoordinateEntity.fromJson(doc['end'])),
    );
  }
}
