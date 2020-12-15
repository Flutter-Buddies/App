import 'package:flutter/material.dart';

abstract class WidgetInfo {
  final String _name = 'Blank';
  final String _description = 'Blank';
  Widget _widget;

  String get name => _name;
  String get description => _description;
  Widget get widget => _widget;

  // can something like this work to add to the list dynamically?
  //void addToList() => widgetInfoList.add(this);
}
