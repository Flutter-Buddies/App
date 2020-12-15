import 'package:flutter/material.dart';

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
