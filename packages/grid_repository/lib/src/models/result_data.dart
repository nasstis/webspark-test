import 'package:grid_repository/grid_repository.dart';

class ResultData {
  final String id;
  final PathResult result;

  ResultData({
    required this.id,
    required this.result,
  });

  ResultDataEntity toEntity() {
    return ResultDataEntity(
      id: id,
      result: result,
    );
  }
}
