import 'package:flutter/material.dart';
import 'package:flutter_buddies/widgets/user_widgets/user_widgets.dart';
//import 'package:flutter_buddies/widgets/user_widgets/widget_info.dart';

//TODO: Test

class UserWidgetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugPrint(widgetInfoList.toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Buddies - User Widgets'),
        ),
        body: ListView.builder(
          itemCount: widgetInfoList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widgetInfoList[index].name),
              subtitle: Text(
                  "${widgetInfoList[index].description} by ${widgetInfoList[index].developer}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => widgetInfoList[index].widget,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
