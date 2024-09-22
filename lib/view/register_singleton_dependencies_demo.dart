import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it_demo/common_widget/common_container.dart';
import 'package:get_it_demo/locator/locator.dart';
import 'package:get_it_demo/store/timer_store.dart';
import 'package:get_it_demo/values/string_constants.dart';
import 'package:get_it_demo/view/temp_class/temp_classes.dart';

class RegisterSingletonDependencies extends StatefulWidget {
  const RegisterSingletonDependencies({super.key});

  @override
  State<RegisterSingletonDependencies> createState() =>
      _RegisterSingletonDependenciesState();
}

class _RegisterSingletonDependenciesState
    extends State<RegisterSingletonDependencies> {
  late TimerStore store;

  @override
  void initState() {
    super.initState();
    store = getIt.get<TimerStore>();
    store.startPeriodicTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.singletonDependenciesDemo),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: getIt.isReady<SharedPreferenceService>(),
                builder: (_, snapshot) {
                  return Observer(builder: (_) {
                    return CommonContainer(
                      iconData: CupertinoIcons.square_favorites,
                      text: StringConstants.sharedPrefReadyToUse,
                      isObjectReadyToUse: snapshot.hasData,
                      countDown: store.countDown.toString(),
                    );
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Icon(CupertinoIcons.plus),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: getIt.isReady<DatabaseService>(),
                builder: (context, snapshot) {
                  return Observer(builder: (_) {
                    return CommonContainer(
                      iconData: CupertinoIcons.bin_xmark_fill,
                      text: StringConstants.databaseServiceReadyToUse,
                      isObjectReadyToUse: snapshot.hasData,
                      countDown: store.countDown.toString(),
                    );
                  });
                },
              ),
              const SizedBox(height: 10),
              const Icon(CupertinoIcons.equal),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: getIt.isReady<LanguagePreferenceService>(),
                builder: (context, snapshot) {
                  return CommonContainer(
                    iconData: Icons.language,
                    text: StringConstants.languageRefReadyToUse,
                    isObjectReadyToUse: snapshot.hasData,
                    loadingWidget: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
