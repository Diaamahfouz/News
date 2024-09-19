import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/shared/api_constants.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsApiDataSource extends NewsDataSource{

  @override
  Future<List<News>> getNews(String sourceId, int page, String? searchTerm) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.newsEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
        'q': searchTerm,
        'page': page.toString(),
        'pageSize': '10',
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponce = NewsResponse.fromJson(json);
     if (newsResponce.status == 'ok' && newsResponce.news != null) {
       return newsResponce.news!;
      } else {
        throw Exception('no news available');
      }
  }
}
