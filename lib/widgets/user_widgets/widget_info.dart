part of user_widgets;

abstract class WidgetInfo {
  final String _name = 'Blank';
  final String _description = 'Blank';
  final String _developer = 'Blank';
  final String _logoPath = "path/to/blank.png";

  Widget _widget;

  String get name => _name;
  String get description => _description;
  String get developer => _developer;
  String get logoPath => _logoPath;
  Widget get widget => _widget;
  int get projectsCount => 1;

  // can something like this work to add to the list dynamically?
  //void addToList() => widgetInfoList.add(this);
}
