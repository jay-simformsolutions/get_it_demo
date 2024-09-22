import 'dart:async';

import 'package:mobx/mobx.dart';

part 'timer_store.g.dart';

class TimerStore = TimerStoreBase with _$TimerStore;

abstract class TimerStoreBase with Store {
  @observable
  int countDown = 0;

  Timer? periodicTimer;

  void startPeriodicTimer() {
    const oneSecond = Duration(seconds: 1);
    periodicTimer = Timer.periodic(oneSecond, (Timer timer) {
      countDown += 1;
    });
  }

  void resetCount() {
    countDown = 0;
    periodicTimer?.cancel();
  }
}
