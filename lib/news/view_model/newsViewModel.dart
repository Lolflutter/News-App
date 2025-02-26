import 'package:flutter/material.dart';
import 'package:news_app/api_manager/network_service/news_network_services.dart';
import '../../api_manager/models/news_article_model.dart';
import '../../api_manager/models/news_source_model.dart';

class NewsViewModel extends ChangeNotifier {
  List<NewsArticle> articles = [];
  List<NewsSource> sources = [];

  Future<void> getNews(String sourceId) async {
    notifyListeners();
    articles = await NewsService.fetchNews(sourceId: sourceId );
    notifyListeners();
  }

  Future<void> getSources(String category) async {
    sources = await NewsService.fetchSources(category);
    if (sources.isNotEmpty) {
      getNews(sources[0].id ?? "");
    }

    notifyListeners();
  }
}
