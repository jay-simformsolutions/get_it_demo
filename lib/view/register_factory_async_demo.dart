import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it_demo/locator/locator.dart';
import 'package:get_it_demo/store/timer_store.dart';
import 'package:get_it_demo/values/string_constants.dart';
import 'package:get_it_demo/view/temp_class/temp_classes.dart';

class RegisterFactoryAsyncDemo extends StatefulWidget {
  const RegisterFactoryAsyncDemo({super.key});

  @override
  State<RegisterFactoryAsyncDemo> createState() =>
      _RegisterFactoryAsyncDemoState();
}

class _RegisterFactoryAsyncDemoState extends State<RegisterFactoryAsyncDemo> {
  late TimerStore store;

  @override
  void initState() {
    super.initState();
    store = getIt.get<TimerStore>();
    store.startPeriodicTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringConstants.registerAsyncFactory,
        ),
        automaticallyImplyLeading: true,
      ),
      body: FutureBuilder(
        future: getIt.getAsync<TempClass4>(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            store.resetCount();
            return Center(
              child: Text(
                '${getIt.getAsync<TempClass4>().runtimeType} is ready to use',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Observer(builder: (_) {
          return Text(store.countDown.toString());
        }),
      ),
    );
  }
}
