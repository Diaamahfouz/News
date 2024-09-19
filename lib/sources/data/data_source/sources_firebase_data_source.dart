import 'package:news/sources/data/data_source/sources_data_source.dart';
import 'package:news/sources/data/models/source.dart';

class SourcesFirebaseDataSource extends SourcesDataSource{
  @override
  Future<List<Source>> getSources(String categoryId)async {
    //firebase logic
    return [];
  }
}
