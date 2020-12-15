import 'package:flutter/material.dart';
import 'modules/screens/user_widgets_screen.dart';
import 'modules/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Buddies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => HomeScreen(),
          'user_widgets_screen': (context) => UserWidgetsScreen(),
        });
  }
}
