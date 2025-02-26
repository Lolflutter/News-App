import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<Response> getSource(String categoryId);
  Future<Response> getNews(String sourceId);
}