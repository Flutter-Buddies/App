part of user_widgets;

//user defines from abstract class needed information
class TestInfo extends WidgetInfo {
  get name => 'My Widget';
  get description => "My Widget is awesome!";
  get widget => TestWidget();
}

TestInfo info = TestInfo();

// User's widget lives here
class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Test 1'),
    );
  }
}
