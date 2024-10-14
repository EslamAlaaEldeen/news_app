import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/feature/News/domain/entities/news.dart';
import 'package:news_app/feature/web_view/web_view_screen.dart';

class ArticleItem extends StatelessWidget {
  final News bs;
  const ArticleItem({super.key, required this.bs});

  @override
  Widget build(BuildContext context) {
    var format = DateFormat.yMEd();
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WebViewScreen(bs.url)));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: bs.backdropPath.isNotEmpty
                      ? CachedNetworkImage(
                          width: 160.0,
                          height: 150,
                          fit: BoxFit.cover,
                          imageUrl: bs.backdropPath,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : Container(
                          width: 160.0,
                          height: 150,
                          color: Colors.grey,
                          child: const Icon(Icons.image_not_supported),
                        ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        bs.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      bs.author, // Parse and format the date
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      format.format(
                          DateTime.parse(bs.date)), // Parse and format the date
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
