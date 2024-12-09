import 'package:news/news/data/models/news.dart';

abstract class NewsStates {}

class NewsInitial extends NewsStates {}

class GetNewsLoading extends NewsStates {}

class GetNewsSuccess extends NewsStates {
  final List<News> newsList;

  GetNewsSuccess(this.newsList);
}

class GetNewsError extends NewsStates {
  final String message;

  GetNewsError(this.message);
}
