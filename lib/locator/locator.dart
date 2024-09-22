import 'package:get_it/get_it.dart';
import 'package:get_it_demo/repository/repository.dart';
import 'package:get_it_demo/store/home_store.dart';
import 'package:get_it_demo/store/payment_store.dart';
import 'package:get_it_demo/utils/shared_preference.dart';

import '../store/article_store.dart';
import '../store/timer_store.dart';
import '../view/temp_class/temp_classes.dart';

/// Step-1 Create function and register all the dependencies

final getIt = GetIt.instance;

/// Register all the dependency
Future<void> initializeDependency() async {
  getIt.registerSingleton(SharedPreferenceHelper());

  getIt.registerLazySingleton(
    () => Repository(),
  );

  getIt.registerFactory(() => HomeStore());
  getIt.registerFactory(() => PaymentStore());
  getIt.registerFactory(() => ArticleStore());
  getIt.registerFactory(() => TimerStore());

  /// Step-3 Register factory Async Object
  getIt.registerFactoryAsync(
    () {
      return Future.delayed(const Duration(seconds: 5), () {
        return TempClass4();
      });
    },
  );

  /// Step-4 Register Singleton Object with dependencies
  getIt.registerLazySingletonAsync<SharedPreferenceService>(() async {
    return Future.delayed(const Duration(seconds: 10), () {
      return SharedPreferenceService();
    });
  });

  getIt.registerLazySingletonAsync(() async {
    return Future.delayed(const Duration(seconds: 5), () {
      return DatabaseService();
    });
  });

  getIt.registerSingletonWithDependencies<LanguagePreferenceService>(
    () => LanguagePreferenceService(getIt(), getIt()),
    dependsOn: [SharedPreferenceService, DatabaseService],
  );
}
