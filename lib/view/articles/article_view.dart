import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it_demo/locator/locator.dart';
import 'package:get_it_demo/navigation/route_strings.dart';
import 'package:get_it_demo/store/article_store.dart';
import 'package:get_it_demo/utils/shared_preference.dart';
import 'package:get_it_demo/values/string_constants.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late ArticleStore store;

  @override
  void initState() {
    super.initState();
    store = getIt.get<ArticleStore>();
  }

  @override
  Widget build(BuildContext context) {
    final sharedPref = getIt.get<SharedPreferenceHelper>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.popularArticles),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(builder: (_) {
              store.counter = sharedPref.gerReadCount() ?? 0;
              return Text(store.counter.toString());
            }),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return store.articleList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: store.articleList.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        store.counter++;
                        sharedPref.setReadCount(store.counter);
                        Navigator.pushNamed(
                            context, RouteStrings.articleDetails,
                            arguments: store.articleList[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              height: 50,
                              width: 50,
                              color: Colors.red,
                              fit: BoxFit.cover,
                              placeholder: (_, __) => Image.network(
                                StringConstants.placeHolderImage,
                              ),
                              errorWidget: (_, __, ___) => Image.network(
                                StringConstants.placeHolderImage,
                              ),
                              imageBuilder: (context, imageProvider) =>
                                  Image.network(
                                fit: BoxFit.cover,
                                store.articleList[index].urlToImage ??
                                    StringConstants.placeHolderImage,
                              ),
                              imageUrl: store.articleList[index].urlToImage ??
                                  StringConstants.placeHolderImage,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                store.articleList[index].title ??
                                    StringConstants.titleNotAvailable,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
