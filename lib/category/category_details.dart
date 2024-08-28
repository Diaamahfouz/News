import 'package:flutter/material.dart';
import 'package:news/news/news_item.dart';
import 'package:news/tabs/tab_item.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.categoryId, {super.key});
  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedTabIndex = 0;
  final sources = List.generate(10, (index) => 'source $index');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              onTap: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              tabs: sources
                  .map(
                    (source) => TabItem(
                      source: source,
                      isSelected: sources.indexOf(source) == selectedTabIndex,
                    ),
                  )
                  .toList()),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, index) => const NewsItem(),
          ),
        ),
      ],
    );
  }
}
