library user_widgets;

// all included parts (widgets) have the packages listed here available to them
// add your required dependencies here
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'widget_info.dart'; //defines the abstract info class
import 'package:url_launcher/url_launcher.dart'; // Added so we can link to socials or Discord
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// You need do the following to add your widget to the project
// TODO: 1. Add "part of user_widgets;" to your widget file.
// TODO: 2. Add "part <path_to>/<your_filename>.dart;" below.
// TODO: 3. Build your widget in your directory
// TODO: 4. Extend WidgetInfo class from './widget_info.dart' in your main widget file.
//   a. See example/example.dart for an example

part 'example/example.dart';
part 'zambrella_widget.dart';

ExampleInfo exampleInfo = ExampleInfo();

// TODO: 5. Add your Widget Info class to the list
List<dynamic> widgetInfoList = [
  exampleInfo,
  zambrella,
  // <-- add your widgetinfo class here
];
// can this be done without instantiating or adding the widgetinfo to the list? (see user_widgets.dart)

// TODO: 6. Create a Pull Request on Github
