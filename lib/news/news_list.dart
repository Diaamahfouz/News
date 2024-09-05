import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/news/news_item.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.sourceId, {super.key, this.query});
  final String sourceId;
  final String? query;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int page = 1;
  int pageSize = 10;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getNews(
        widget.sourceId,
        page,
        pageSize,
        widget.query ?? "",
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          if (snapshot.hasData) {
            final newsList = snapshot.data?.news ?? [];
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (_, index) => NewsItem(newsList[index]),
            );
          } else {
            return const Center(
              child: Text('No news available'),
            );
          }
        }
      },
    );
  }
}
