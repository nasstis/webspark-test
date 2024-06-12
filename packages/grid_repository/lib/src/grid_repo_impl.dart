import 'dart:developer';

import 'package:grid_repository/src/entities/entities.dart';
import 'package:grid_repository/src/grid_repo.dart';
import 'package:grid_repository/src/models/response_data.dart';
import 'package:dio/dio.dart';
import 'package:grid_repository/src/models/result_data.dart';

class GridRepoImpl extends GridRepo {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 15000),
      sendTimeout: const Duration(milliseconds: 15000),
    ),
  );

  @override
  Future<ResponseData> getGridResponseData(String url) async {
    try {
      final response = await dio.get(url);
      return ResponseData.fromEntity(
          ResponseDataEntity.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response != null) {
        log(e.response!.data);
        log(e.response!.headers.toString());
        log(e.response!.requestOptions.toString());
      } else {
        log(e.requestOptions.toString());
        if (e.message != null) {
          log(e.message!);
        }
      }
      throw Exception('Failed to load grid response data');
    }
  }

  @override
  Future<void> sendResultData(List<ResultData> results) async {
    try {
      final response = await dio.post(
          'https://flutter.webspark.dev/flutter/api',
          data: results.map((e) => e.toEntity().toJson()).toList());
      log('Response status: ${response.statusCode}');
      log('Response data: ${response.data}');
    } catch (e) {
      log('Error sending result data: $e');
    }
  }
}
