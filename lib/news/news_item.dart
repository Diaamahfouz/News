import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Image.asset(
              'assets/images/news.png',
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'BBC News',
            style:
                titleSmallStyle?.copyWith(color: AppTheme.grey, fontSize: 10),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Why are football's biggest clubs starting a new tournament?",
            style: titleSmallStyle?.copyWith(
              color: AppTheme.navy,
              fontWeight: FontWeight.w500,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(
                DateTime(2024, 8, 28, 15, 10),
              ),
              style: titleSmallStyle?.copyWith(
                color: AppTheme.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
