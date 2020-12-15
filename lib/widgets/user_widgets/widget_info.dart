import 'package:flutter/material.dart';

abstract class WidgetInfo {
  final String _name = 'Blank';
  final String _description = 'Blank';
  final String _developer = 'Blank';

  Widget _widget;

  String get name => _name;
  String get description => _description;
  String get developer => _developer;
  Widget get widget => _widget;

  // can something like this work to add to the list dynamically?
  //void addToList() => widgetInfoList.add(this);
}
