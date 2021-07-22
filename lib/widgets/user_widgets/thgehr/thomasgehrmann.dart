part of user_widgets;

//user defines from abstract class needed information
class GehrmannInfo extends WidgetInfo {
  @override
  String get name =>
      'My Widget'; //name your widget, not used in design currently

  @override
  String get description => 'This is an example of a basic widget';

  @override
  String get developer => 'Thomas Gehrmann'; //use any name for yourself

  @override
  String get logoPath => 'assets/profile_logos/flutter_buddy.png';

  @override
  Widget get widget => GehrmannWidget();
}

GehrmannInfo gehrmannInfo = GehrmannInfo();

// User's widget lives here
class GehrmannWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.1, 0.5, 0.8, 0.9],
              colors: [Colors.red, Colors.yellow, Colors.blue, Colors.purple],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Thomas Gehrmann',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                Text('AI, Blockchain and Flutter Enthusiast'),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child:
                      Text('''I studied Physics and Economics in Bonn, Germany.
I am very curios and fascinated by new technologies, like AI and Blockchain.
                  '''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
