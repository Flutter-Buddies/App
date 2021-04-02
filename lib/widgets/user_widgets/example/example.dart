part of user_widgets;

//user defines from abstract class needed information
class ExampleInfo extends WidgetInfo {
  @override
  String get name =>
      'My Widget'; //name your widget, not used in design currently

  @override
  String get description => 'This is an example of a basic widget';

  @override
  String get developer => 'Joey Marino'; //use any name for yourself

  @override
  String get logoPath => 'assets/profile_logos/flutter_buddy.png';

  @override
  Widget get widget => ExampleWidget();
}

ExampleInfo exampleInfo = ExampleInfo();

// User's widget lives here
class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: Text('Example Widget'),
            ),
          ],
        ),
      ),
    );
  }
}
