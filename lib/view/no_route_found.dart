import 'package:flutter/material.dart';

class NoRoutesFound extends StatelessWidget {
  const NoRoutesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Routes Found'),
      ),
    );
  }
}
