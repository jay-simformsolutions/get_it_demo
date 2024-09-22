import 'package:flutter/material.dart';
import 'package:get_it_demo/utils/extensions.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    required this.iconData,
    required this.text,
    required this.isObjectReadyToUse,
    this.countDown,
    this.loadingWidget,
  });

  final IconData iconData;
  final String text;
  final bool isObjectReadyToUse;
  final String? countDown;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: isObjectReadyToUse
          ? Column(
              children: [
                Icon(iconData),
                Center(
                  child: Text(text),
                ),
              ],
            )
          : countDown.isNotNullNotEmpty()
              ? Center(
                  child: Text(
                    countDown!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                )
              : loadingWidget,
    );
  }
}
