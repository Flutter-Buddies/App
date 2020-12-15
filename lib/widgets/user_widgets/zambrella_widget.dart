part of user_widgets;

//user defines from abstract class needed information
class Zambrella extends WidgetInfo {
  get name => 'Doug \"Zambrella\" Todd';
  get description =>
      "DOTA player | Flutter Developer | Biochemistry Graduate | Tech Enthusiast | Metal Music Lover";
  get developer => "Douglas Todd"; //use any name for yourself
  get widget => ZambrellaWidget();
}

Zambrella zambrella = Zambrella();

// User's widget lives here
class ZambrellaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.red),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Doug Todd'),
          actions: [
            GestureDetector(
              onTap: () {
                print('Twitter');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage(
                      'https://1000logos.net/wp-content/uploads/2017/06/Twitter-Logo.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
