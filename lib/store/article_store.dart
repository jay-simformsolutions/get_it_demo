import 'package:get_it_demo/locator/locator.dart';
import 'package:get_it_demo/model/article_model.dart';
import 'package:get_it_demo/repository/repository.dart';
import 'package:get_it_demo/values/enumeration.dart';
import 'package:mobx/mobx.dart';

part 'article_store.g.dart';

class ArticleStore = ArticleStoreBase with _$ArticleStore;

abstract class ArticleStoreBase with Store {
  ArticleStoreBase() {
    getArticlesData();
  }

  @observable
  int counter = 0;

  /// step-4 Access Repository object

  final _repository = getIt.get<Repository>();

  @observable
  NetworkState networkState = NetworkState.initial;

  ObservableList<Articles> articleList = ObservableList();

  Future<List<Articles>> getArticlesData() async {
    networkState = NetworkState.loading;
    final result = await _repository.getArticleData();
    articleList.addAll(result);
    networkState = NetworkState.success;
    return articleList;
  }
}
