import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/tabs/sources_tabs.dart';

import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails(this.categoryId, {this.query, super.key});
  final String categoryId;
  final String? query;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return SourcesTabs(
            sources,
            query: query,
          );
        }
      },
    );
  }
}
