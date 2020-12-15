library user_widgets;

// all included parts (widgets) have the packages listed here available to them
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'widget_info.dart'; //defines the abstract info class

// You need do the following to add your widget to the project
// 1. Add "part of user_widgets" to your widget file.
// 2. Add "part your_filename.dart" below.
// 3. Extend WidgetInfo class from 'widget_info.dart in your widget file.
//   a. See test1.dart for an example
// Note: You won't be able to import additional packages other than those declared here, except by permission.
//       Initial version will only have built-in Flutter state management (setState(), InheritedWidget, etc)
//       You can grow your widget as the app grows.
//       This app WILL (hopefully) be published to the app stores and updated as new user widgets added!
part 'example.dart';

//4. Add your Widget Info class to the list
List<dynamic> widgetInfoList = [
  info,
  // <-- add your widgetinfo class here
];
// can this be done without adding the widgetinfo to the list? (see user_widgets.dart)
