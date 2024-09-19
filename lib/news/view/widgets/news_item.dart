import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:news/views/item_selected.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(
    this.news, {
    super.key,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ItemSelected.routeName, arguments: news);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(
                imageUrl:  news.urlToImage ??
                    'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                placeholder: (context, url) => const LoadingIndicator(),
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              
              news.source?.name ?? '',
              style:
                  titleSmallStyle?.copyWith(color: AppTheme.grey, fontSize: 10),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              news.title ?? '',
              style: titleSmallStyle?.copyWith(
                color: AppTheme.navy,
                fontWeight: FontWeight.w500,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                timeago.format(
                  (news.publishedAt ?? DateTime.now()),
                ),
                style: titleSmallStyle?.copyWith(
                  color: AppTheme.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
