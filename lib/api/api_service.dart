import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:news/models/sources_response/sources_response.dart';

class ApiService {
  static Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sourcesEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        'category': categoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<dynamic> getNews(
      String sourceId, int page, String? searchTerm) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.newsEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
        'q': searchTerm,
        'page': page.toString(),
        'pageSize': '4',
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
