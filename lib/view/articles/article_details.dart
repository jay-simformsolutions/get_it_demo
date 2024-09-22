import 'package:flutter/material.dart';
import 'package:get_it_demo/model/article_model.dart';
import 'package:get_it_demo/values/string_constants.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({required this.articles, super.key});

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article Details Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    articles.urlToImage?.toString() ??
                        StringConstants.placeHolderImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(articles.publishedAt.toString()),
            ),
            const SizedBox(height: 10),
            Text(
              articles.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              articles.description?.toString() ??
                  StringConstants.descriptionNotAvailable,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(
              articles.content?.toString() ??
                  StringConstants.contentNotAvailable,
              textAlign: TextAlign.start,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
