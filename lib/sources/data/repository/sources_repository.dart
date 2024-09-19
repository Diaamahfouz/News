import 'package:news/sources/data/data_source/sources_data_source.dart';
import 'package:news/sources/data/models/source.dart';

class SourcesRepository {
  final SourcesDataSource dataSource;

  SourcesRepository(this.dataSource);

  Future<List<Source>> getSources(String categoryId) async {
    return dataSource.getSources(categoryId);
  }
}
