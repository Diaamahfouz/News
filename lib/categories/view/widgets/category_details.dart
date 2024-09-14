import 'package:flutter/material.dart';

import 'package:news/sources/view/widgets/sources_tabs.dart';
import 'package:news/sources/view_model/sources_view_model.dart';

import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.categoryId, {this.query, super.key});
  final String categoryId;
  final String? query;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourcesViewModel();

  @override
  void initState() {
    viewModel.getSources(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<SourcesViewModel>(builder: (_, value, __) {
        if (viewModel.isLoading) {
          return const LoadingIndicator();
        } else if (viewModel.errorMessage!=null) {
          return  ErrorIndicator(viewModel.errorMessage!);
        } else {
          
          return SourcesTabs(
           viewModel.sources, query: widget.query,
          );
        }

        
      },),
    );
    // FutureBuilder(
    //   future: ApiService.getSources(categoryId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const LoadingIndicator();
    //     } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
    //       return const ErrorIndicator();
    //     } else {
    //       final sources = snapshot.data?.sources ?? [];
    //       return SourcesTabs(
    //         sources,
    //         query: query,
    //       );
    //     }
    //   },
    // );
  }
}
