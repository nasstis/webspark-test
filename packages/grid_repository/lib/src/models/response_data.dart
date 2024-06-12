import 'package:grid_repository/src/entities/response_data_entity.dart';
import 'package:grid_repository/src/models/grid_data.dart';

class ResponseData {
  final bool error;
  final String message;
  final List<GridData> data;

  ResponseData({
    required this.error,
    required this.message,
    required this.data,
  });

  static ResponseData fromEntity(ResponseDataEntity entity) {
    return ResponseData(
      error: entity.error,
      message: entity.message,
      data: entity.data,
    );
  }
}
