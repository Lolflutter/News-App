import 'package:dio/dio.dart';
import '../models/news_article_model.dart';
import '../models/news_source_model.dart';

class NewsService {
  static final Dio _dio = Dio();
  static final String _apiKey = "3b1576465f4a482c8c1393718bb33145";
  static final String _baseUrl = "https://newsapi.org/v2";

  static Future<List<NewsArticle>> fetchNews({
    String? query,
    String? sourceId,
  }) async {
    String endpoint =
        query != null && query.isNotEmpty ? "/everything" : "/top-headlines";

    Map<String, String> queryParams = {
      "apiKey": _apiKey,
      if (query != null && query.isNotEmpty) "q": query,
      if (sourceId != null && sourceId.isNotEmpty) "sources": sourceId,
      if (query == null && sourceId == null) "country": "us",
    };

    Response response = await _dio.get(
      "$_baseUrl$endpoint",
      queryParameters: queryParams,
    );
    List<dynamic> articles = response.data["articles"];
    return articles.map((json) => NewsArticle.fromJson(json)).toList();
  }

  static Future<List<NewsSource>> fetchSources(String categoryId) async {
    Response response = await _dio.get(
      "$_baseUrl/top-headlines/sources",
      queryParameters: {"apiKey": _apiKey, "category": categoryId},
    );

    List<dynamic> sources = response.data["sources"];
    return sources.map((json) => NewsSource.fromJson(json)).toList();
  }
}
