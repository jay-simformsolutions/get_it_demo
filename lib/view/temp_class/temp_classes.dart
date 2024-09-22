import 'package:geolocator_platform_interface/src/models/position.dart';

class SharedPreferenceService {
  SharedPreferenceService() {
    print('Shared Preference is registered');
  }
}

class DatabaseService {
  DatabaseService() {
    print('Database Service is registered');
  }
}

class LanguagePreferenceService {
  SharedPreferenceService sharedPreferenceService;
  DatabaseService databaseService;
  LanguagePreferenceService(
      this.sharedPreferenceService, this.databaseService) {
    print('LanguagePreferenceService is registered');
  }
}

class TempClass4 {
  TempClass4() {
    print('Temp class-4 is ready to use');
  }
}

class UserLocation {
  UserLocation(Position currentPosition);
}
