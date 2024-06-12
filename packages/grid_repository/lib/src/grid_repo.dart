import 'models/models.dart';

abstract class GridRepo {
  Future<ResponseData> getGridResponseData(String url);

  Future<void> sendResultData(List<ResultData> results);
}
