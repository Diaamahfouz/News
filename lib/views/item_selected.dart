import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response/news.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class ItemSelected extends StatefulWidget {
  static const String routeName = 'itemSelected';
  const ItemSelected({super.key});

  @override
  State<ItemSelected> createState() => _ItemSelectedState();
}

class _ItemSelectedState extends State<ItemSelected> {
  @override
  Widget build(BuildContext context) {
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    News? news;
    news = ModalRoute.of(context)!.settings.arguments as News;
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/pattern.png',
            ),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News App',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                news.urlToImage ??
                    'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                height: MediaQuery.of(context).size.height * 0.30,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                news.source?.name ?? '',
                style: titleSmallStyle?.copyWith(
                    color: AppTheme.grey, fontSize: 10),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                news.title ?? '',
                style: titleSmallStyle?.copyWith(
                  color: AppTheme.navy,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 6,
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
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                news.description ?? '',
                style: titleSmallStyle?.copyWith(
                    color: AppTheme.grey, fontSize: 15),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  await launchUrl(
                    Uri.parse(news?.url ?? "https://google.com"),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Full Article',
                      style: titleSmallStyle?.copyWith(
                          color: AppTheme.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
