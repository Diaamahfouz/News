import 'package:news/news/data/models/news.dart';

abstract class NewsDataSource {
  Future<List<News>> getNews(String sourceId, int page, String? searchTerm);
}
