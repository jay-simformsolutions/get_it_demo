import 'package:flutter/material.dart';
import 'package:get_it_demo/navigation/route_strings.dart';
import 'package:get_it_demo/navigation/routes.dart';

import 'locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Step-2 Initialize the dependency
  await initializeDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RouteStrings.homePageRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
