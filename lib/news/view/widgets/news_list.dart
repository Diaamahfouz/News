import 'package:flutter/material.dart';

import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';

import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.sourceId, {super.key, this.query});
  final String sourceId;
  final String? query;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId, 1, widget.query);
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          } else {
            return ListView.builder(
              itemBuilder: (_, index) => NewsItem(viewModel.newsList[index]),
              itemCount: viewModel.newsList.length,
            );
          }
        },
      ),
    );
    // FutureBuilder(
    //   future: ApiService.getNews(
    //     widget.sourceId,
    //     page,
    //     widget.query ?? "",
    //   ),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting &&
    //         isLoading == false) {
    //       return const LoadingIndicator();
    //     } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
    //       return const ErrorIndicator('');
    //     } else {
    //       if (selectSourceId != widget.sourceId) {
    //         page = 1;
    //         selectSourceId = widget.sourceId;
    //         newsList = [];
    //         isLoading = false;
    //       }
    //       newsList.addAll(snapshot.data?.news.toList());
    //       articles = newsList.toSet();
    //       newsList = articles.toList();
    //       return NotificationListener<ScrollNotification>(
    //         onNotification: (notification) {
    //           if (notification.metrics.pixels ==
    //                   notification.metrics.maxScrollExtent &&
    //               notification is ScrollUpdateNotification) {
    //             if (snapshot.data?.news.isNotEmpty) {
    //               page++;
    //               isLoading = true;
    //               setState(() {});
    //             }
    //           }
    //           return true;
    //         },
    //         child: ListView.builder(
    //           itemCount: newsList.length + 1,
    //           itemBuilder: (_, index) {
    //             if (index < newsList.length) {
    //               return NewsItem(
    //                 newsList[index],
    //               );
    //             } else {
    //               return newsList.length != snapshot.data?.totalResults
    //                   ? Padding(
    //                       padding: EdgeInsets.symmetric(
    //                           vertical:
    //                               MediaQuery.sizeOf(context).height * .05),
    //                       child: const LoadingIndicator(),
    //                     )
    //                   : const SizedBox();
    //             }
    //           },
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
