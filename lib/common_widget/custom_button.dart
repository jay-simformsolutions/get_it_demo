import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.buttonText,
    required this.function,
    super.key,
  });

  final String buttonText;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: function, child: Text(buttonText));
  }
}
