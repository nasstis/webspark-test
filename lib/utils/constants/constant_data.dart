import 'package:grid_repository/grid_repository.dart';

class DataService {
  static final DataService _instance = DataService._internal();

  factory DataService() {
    return _instance;
  }

  DataService._internal();

  ResponseData? _responseData;
  List<ResultData>? _resultDataList;

  void setResponseData(ResponseData responseData) {
    _responseData = responseData;
  }

  void setResultData(List<ResultData>? resultData) {
    _resultDataList = resultData;
  }

  ResponseData? getResponseData() {
    return _responseData;
  }

  List<ResultData>? getResultDataList() {
    return _resultDataList;
  }
}
