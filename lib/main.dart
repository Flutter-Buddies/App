import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_buddies/constants/app_constants.dart';
import 'package:flutter_buddies/modules/screens/about_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'modules/screens/user_widgets_screen.dart';
import 'modules/screens/home_screen.dart';
import 'modules/screens/projects_screen.dart';
import 'modules/screens/schedule_screen.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Buddies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => HomeScreen(),
          'user_widgets_screen': (context) => UserWidgetsScreen(),
          'schedule': (context) => ScheduleScreen(),
          'projects': (context) => ProjectsScreen(),
          'about': (context) => AboutScreen(),
        });
  }
}
