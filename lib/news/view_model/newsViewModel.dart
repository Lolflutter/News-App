import 'package:flutter/material.dart';
import '../data/local_data_source/local_data_sorece_imp.dart';
import '../data/models/news_article_model.dart';
import '../data/models/news_source_model.dart';
import '../data/remote_data_source/remote_data_source_imp.dart';
import '../data/repo/newsRepo.dart';
import '../data/repo/newsRepoImp.dart';

class NewsViewModel extends ChangeNotifier {
  List<NewsArticle> articles = [];
  List<NewsSource> sources = [];
  late NewsRepo repo;

  NewsViewModel() {
    repo = NewsRepoImp(
      remoteDataSource: RemoteDataSourceImp(),
      localDataSource: LocalDataSourceImp(),
    );
  }

  Future<void> getNews(String sourceId) async {
    articles = await repo.getNews(sourceId);
    notifyListeners();
  }

  Future<void> getSources(String category) async {
    sources = await repo.getSources(category);
    if (sources.isNotEmpty) {
      await getNews(sources[0].id ?? "");
    }
    notifyListeners();
  }
}
