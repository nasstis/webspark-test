import '../entities/entities.dart';

class Coordinate {
  final int x;
  final int y;

  const Coordinate({
    required this.x,
    required this.y,
  });

  static Coordinate fromEntity(CoordinateEntity entity) {
    return Coordinate(
      x: entity.x,
      y: entity.y,
    );
  }

  CoordinateEntity toEntity() {
    return CoordinateEntity(
      x: x,
      y: y,
    );
  }

  @override
  bool operator ==(Object other) {
    return (other is Coordinate) && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => '($x, $y)';
}
