import 'package:news/news/data/repository/news_repository.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/shared/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsViewModel extends Cubit<NewsStates> {
  late final NewsRepository repository;
  NewsViewModel() : super(NewsInitial()) {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }
  Future<void> getNews(String sourceId, int page, String? query) async {
    emit(GetNewsLoading());
    try {
      final newsList = await repository.getNews(sourceId, 1, query);
      emit(GetNewsSuccess(newsList));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }
}