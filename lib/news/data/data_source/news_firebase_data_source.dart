import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsFirebaseDataSource extends NewsDataSource {
  @override
  Future<List<News>> getNews(String sourceId,int page,String? searchTerm) async{
    //firebase logic
    return [];
  }
}
