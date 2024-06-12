import '../models/grid_data.dart';
import 'entities.dart';

class ResponseDataEntity {
  final bool error;
  final String message;
  final List<GridData> data;

  ResponseDataEntity({
    required this.error,
    required this.message,
    required this.data,
  });

  static ResponseDataEntity fromJson(Map<String, dynamic> doc) {
    return ResponseDataEntity(
      error: doc['error'],
      message: doc['message'],
      data: List<GridData>.from(doc['data']
          .map((e) => GridData.fromEntity(GridDataEntity.fromJson(e)))),
    );
  }
}
