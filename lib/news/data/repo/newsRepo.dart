
import '../models/news_article_model.dart';
import '../models/news_source_model.dart';

abstract class NewsRepo {
  Future<List<NewsArticle>> getNews(String sourceId);
  Future<List<NewsSource>> getSources(String categoryId);
}
