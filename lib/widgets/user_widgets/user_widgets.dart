library user_widgets;

// all included parts (widgets) have the packages listed here available to them
// add your required dependencies here
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart'; // Added so we can link to socials or Discord
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// imports for Goober's developer widget
import 'goober0329/qr_game_of_life/gol_glider.dart';

part 'widget_info.dart'; //defines the widget info abstract class

// You need do the following to add your widget to the project
// TODO: 1. Add "part of user_widgets;" to your widget file.
// TODO: 2. Add "part <path_to>/<your_filename>.dart;" below.
// TODO: 3. Build your widget in your directory
// TODO: 4. Extend WidgetInfo class from './widget_info.dart' in your main widget file.
// TODO: 4a. Instantiate your WidgetInfo Object in your widget's dart file
// TODO: 4b. See example/example.dart for an example of step 4

part 'example/example.dart';
part 'zambrella/zambrella_widget.dart';
part 'goober0329/goober_widget.dart';

// TODO: 5. Add your Widget Info class object from step 4a to the list
List<WidgetInfo> widgetInfoList = [
  exampleInfo,
  zambrella, //user @Zambrella
  goober,
  // Below 2 added just to make the list at least 4 long
  exampleInfo,
  exampleInfo,
  // <-- add your widgetinfo class here
];
// can this be done without instantiating or adding the widgetinfo to the list? (see user_widgets.dart)

// TODO: 6. Create a Pull Request on Github
