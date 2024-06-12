import 'package:grid_repository/grid_repository.dart';

class ResultDataEntity {
  final String id;
  final PathResult result;

  ResultDataEntity({
    required this.id,
    required this.result,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "result": result.toEntiy().toJson(),
    };
  }
}
