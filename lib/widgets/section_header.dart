import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final IconData leadingIcon;
  final String headerText;
  final Widget trailingWidget;
  final Function headerFunction;
  SectionHeader(
      {this.leadingIcon,
      this.headerText,
      this.trailingWidget,
      this.headerFunction});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: headerFunction,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Icon(leadingIcon),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    headerText + '  >',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            trailingWidget,
          ],
        ),
      ),
    );
  }
}
