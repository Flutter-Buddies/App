library user_widgets;

// all included parts have the packages listed here available to them
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'widget_info.dart'; //defines the abstract info class

// You need do the following to add your widget to the project
// 1. Add "part of user_widgets" to your widget file.
// 2. Add "part your_filename.dart" below.
// 3. Extend WidgetInfo class in your widget file.
// Note: You won't be able to import additional packages other than those declared here.
part 'test1.dart';

//4. Add your Widget Info class to the list
List<dynamic> widgetInfoList = [
  info,
];
// can this be done without adding the info to the list? (see user_widgets.dart)
