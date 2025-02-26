import 'package:dio/dio.dart';
import 'remote_data_source.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  final Dio _dio = Dio();
  final String _apiKey = "3b1576465f4a482c8c1393718bb33145";
  final String _baseUrl = "https://newsapi.org/v2";

  @override
  Future<Response> getNews(String sourceId) async {
    return await _dio.get(
      "$_baseUrl/top-headlines",
      queryParameters: {
        "apiKey": _apiKey,
        "sources": sourceId,
      },
    );
  }

  @override
  Future<Response> getSource(String categoryId) async {
    return await _dio.get(
      "$_baseUrl/top-headlines/sources",
      queryParameters: {
        "apiKey": _apiKey,
        "category": categoryId,
      },
    );
  }
}
