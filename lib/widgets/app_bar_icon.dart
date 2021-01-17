import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final String iconText;
  final Function iconFunction;
  final Color iconColor;
  final ImageProvider iconImage;
  AppBarIcon(
      {this.iconText, this.iconFunction, this.iconColor, this.iconImage});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: iconFunction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: iconImage,
            height: 42,
          ),
          Text(iconText),
        ],
      ),
    );
  }
}
