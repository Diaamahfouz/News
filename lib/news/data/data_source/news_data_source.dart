import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/shared/api_constants.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsDataSource {
  Future<NewsResponse> getNews(
      String sourceId, int page, String? searchTerm) async {
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
    // print(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
