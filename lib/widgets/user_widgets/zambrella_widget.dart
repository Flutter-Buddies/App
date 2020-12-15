part of user_widgets;

//user defines from abstract class needed information
class Zambrella extends WidgetInfo {
  get name => 'Zambrella';
  get description => "Doug Todd";
  get widget => ZambrellaWidget();
}

Zambrella zambrella = Zambrella();

// User's widget lives here
class ZambrellaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Test 1'),
    );
  }
}
