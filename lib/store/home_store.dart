import 'package:get_it_demo/locator/locator.dart';
import 'package:get_it_demo/model/user_profile_model.dart';
import 'package:get_it_demo/repository/repository.dart';
import 'package:get_it_demo/values/enumeration.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  /// step-4 Access Repository object

  final _repository = getIt.get<Repository>();

  @observable
  NetworkState networkState = NetworkState.initial;

  ObservableList<UserProfile> users = ObservableList();

  Future<List<UserProfile>> getUserProfile() async {
    networkState = NetworkState.loading;
    final result = await _repository.getUserProfileList();
    users.addAll(result);
    networkState = NetworkState.success;
    return users;
  }
}
