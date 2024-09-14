import 'package:flutter/material.dart';
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsViewModel with ChangeNotifier {
  final dataSource = NewsDataSource();
  List<News> newsList = [];


  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String sourceId, int page,String? query) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getNews(sourceId, 1, query);
      if (response.status == 'ok' && response.news != null) {
     
        newsList = response.news!;
      } else {
        errorMessage = 'no news available';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
