class CoordinateEntity {
  final int x;
  final int y;

  CoordinateEntity({
    required this.x,
    required this.y,
  });

  static CoordinateEntity fromJson(Map<String, dynamic> doc) {
    return CoordinateEntity(
      x: doc['x'],
      y: doc['y'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "x": x,
      "y": y,
    };
  }
}
