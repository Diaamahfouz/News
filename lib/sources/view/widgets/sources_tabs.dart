import 'package:flutter/material.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/news/view/widgets/news_list.dart';
import 'package:news/sources/view/widgets/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs(this.sources, {required this.query, super.key});

  final List<Source> sources;
  final String? query;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
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
              tabs: widget.sources
                  .map(
                    (source) => TabItem(
                      source: source.name ?? '',
                      isSelected:
                          widget.sources.indexOf(source) == selectedTabIndex,
                    ),
                  )
                  .toList()),
        ),
        Expanded(
          child: NewsList(widget.sources[selectedTabIndex].id ?? '',query: widget.query,),
        ),
      ],
    );
  }
}
