import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../local_data_source/local_data_source.dart';
import '../models/news_article_model.dart';
import '../models/news_source_model.dart';
import '../remote_data_source/remote_data_source.dart';
import 'newsRepo.dart';

class NewsRepoImp implements NewsRepo {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  NewsRepoImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<NewsArticle>> getNews(String sourceId) async {
    bool hasInternet = await InternetConnection().hasInternetAccess;
    if (hasInternet) {
      final response = await remoteDataSource.getNews(sourceId);
      final newsList = (response.data["articles"] as List)
          .map((json) => NewsArticle.fromJson(json))
          .toList();

      await localDataSource.saveData({"articles": response.data["articles"]});
      return newsList;
    } else {
      var cachedData = await localDataSource.getData();
      if (cachedData != null && cachedData["articles"] != null) {
        return (cachedData["articles"] as List)
            .map((json) => NewsArticle.fromJson(json))
            .toList();
      }
      return [];
    }
  }

  @override
  Future<List<NewsSource>> getSources(String categoryId) async {
    bool hasInternet = await InternetConnection().hasInternetAccess;
    if (hasInternet) {
      final response = await remoteDataSource.getSource(categoryId);
      final sourceList = (response.data["sources"] as List)
          .map((json) => NewsSource.fromJson(json))
          .toList();

      await localDataSource.saveData({"sources": response.data["sources"]});
      return sourceList;
    } else {
      var cachedData = await localDataSource.getData();
      if (cachedData != null && cachedData["sources"] != null) {
        return (cachedData["sources"] as List)
            .map((json) => NewsSource.fromJson(json))
            .toList();
      }
      return [];
    }
  }
}
