import 'package:flutter/material.dart';
import 'package:flutter_buddies/widgets/user_widgets/user_widgets.dart';
//import 'package:flutter_buddies/widgets/user_widgets/widget_info.dart';

List<WidgetInfo> widgetList = widgetInfoList;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Flutter Buddies App')),
        body: Container(
          child: Column(children: [
            RaisedButton(
              child: Text('User Widgets'),
              onPressed: () {
                Navigator.pushNamed(context, 'user_widgets_screen');
              },
            ),
          ]),
        ),
      ),
    );
  }
}
