part of user_widgets;

//user defines from abstract class needed information
class Rift extends WidgetInfo {
  @override
  String get name => 'Jason "Rift" Williams';

  @override
  String get description =>
      'Flutter Developer | Philosopher | Futurist | Gamer | Dreamer';

  @override
  String get developer => 'Jason Williams'; //use any name for yourself

  @override
  String get logoPath => 'assets/profile_images/jason_profile.jpg';

  @override
  Widget get widget => RiftWidget();
}

Rift rift = Rift();

// User's widget lives here
class RiftWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _renderName(context) {
    return Container(
      height: 100,
      child: Card(
        elevation: 0.0,
        margin:
            EdgeInsets.only(left: 44.0, right: 44.0, top: 10.0, bottom: 0.0),
        color: Color(0xFF74B856),
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 1000,
          front: Container(
            decoration: BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(
                color: Colors.black,
                width: 5,
              ),
            ),
            child: Center(
              child: Text(
                'Jason Williams',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          back: Container(
            decoration: BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
            ),
            child: Center(
              child: Text(
                '\'Rift\'',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderBg() {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF74B856)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      child: Scaffold(
        backgroundColor: Color(0xFF74B856),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xFF74B856),

              /// Set to false so that appbar is always invisible after
              /// collapsing
              /// If set to true here, the app bar will expand as soon as you
              /// start scrolling up even if you haven't reached the top
              floating: true,
              snap: true,

              /// To make the app bar visible at all times after collapsing
              /// we set pinned to true
              pinned: false,
              expandedHeight: 200.0,

              ///Properties of the App Bar when it is expanded
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: MyImageCard(),
                collapseMode: CollapseMode.none,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _renderBg(),
                  _renderName(context),
                  MyCard(
                      'About',
                      '#About',
                      '''I studied Computer Science at the University of the West Indies. From a young age I have always had an interest in technology. I believe that technology can be a great force for good in the world. Game development was what really made me want to get into programming but I have yet to truly go down that path.
                ''',
                      Icons.info,
                      40.0,
                      250.0),
                  MyCard(
                      'My Flutter journey',
                      '#My Flutter journey',
                      '''I started my Flutter Journey after the COVID-19 pandemic hit. The AppBrewry's Flutter Development BootCamp gave me a good understanding and appreciation for Flutter. I have worked on a couple personal projects and continue to dive deeper into flutter.
                ''',
                      Icons.airport_shuttle,
                      25.0,
                      220.0),
                  MyCard(
                      'Skills',
                      '#Skill',
                      '''-Flutter App Development
-Web Development
-Digital Marketing
-Design Thinking
-Social Media Marketing
                ''',
                      Icons.flash_on_outlined,
                      40.0,
                      200.0),
                  MyCard(
                      'Interests',
                      '#Interests',
                      '''-Future Tech
-Psychology
-Philosophy
-Video Games
-Virtual Reality
-Mixed Reality
                ''',
                      Icons.gamepad_outlined,
                      40.0,
                      200.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyImageCard extends StatelessWidget {
  const MyImageCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Color(0xFF74B856),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        front: Container(
          height: 200.0,
          padding: EdgeInsets.only(
              top: 10.0, left: 110.0, right: 110.0, bottom: 10.0),
          margin: EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
            child: Image.asset(
              'assets/profile_images/jason_profile.jpg',
              fit: BoxFit.fill,
              width: 20,
            ),
          ),
        ),
        back: Container(
          height: 200.0,
          padding: EdgeInsets.only(
              top: 10.0, left: 110.0, right: 110.0, bottom: 10.0),
          margin: EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
            child: Image.asset(
              'assets/profile_images/jason_profile.jpg',
              fit: BoxFit.fill,
              width: 20,
            ),
          ),
        ),
      ),
    );
  }
}

// A Reusable Flip Card
class MyCard extends StatelessWidget {
  final String infoTitle;
  final String infoBody;
  final IconData infoIcon;
  final String frontTitle;
  final double frontTextSize;
  final double cardHeight;

  MyCard(this.infoTitle, this.frontTitle, this.infoBody, this.infoIcon,
      this.frontTextSize, this.cardHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
      height: cardHeight,
      child: Card(
        elevation: 0.0,
        color: Color(0xFF74B856),
        child: FlipCard(
          direction: FlipDirection.VERTICAL,
          speed: 1000,
          front: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(
                color: Colors.black,
                width: 5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  frontTitle,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: frontTextSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          back: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF006666),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: InfoSection(
                  title: infoTitle,
                  body: infoBody,
                  dividerColor: Colors.white,
                  icon: infoIcon,
                  iconColor: Colors.white,
                ),
              )),
        ),
      ),
    );
  }
}

/*


@override
void initState() {
  super.initState();
  _animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 1));
  _animation = Tween(end: 1, begin: 0).animate(_animationController)
    ..addListener(() {
      setState(() {});
    })
    ..addStatusListener((status) {
      _animationStatus = status;
    });
}

return Scaffold(
backgroundColor: Colors.teal,
body: SafeArea(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
CircleAvatar(
radius: 100.0,
backgroundImage:
AssetImage('assets/profile_images/jason_profile.jpg'),
),
Text(
'Angela  Yu',
style: TextStyle(
fontFamily: 'Pacifico',
fontSize: 40.0,
color: Colors.white,
fontWeight: FontWeight.bold,
),
),
Text(
'FLUTTER DEVELOPER',
style: TextStyle(
fontFamily: 'Source Sans Pro',
color: Colors.teal.shade100,
fontSize: 20.0,
letterSpacing: 2.5,
fontWeight: FontWeight.bold,
),
),
SizedBox(
height: 20.0,
width: 150.0,
child: Divider(
color: Colors.teal.shade100,
),
),
Container(
color: Color.fromARGB(255, 27, 28, 30),
child: Center(
child: Transform(
alignment: FractionalOffset.center,
transform: Matrix4.identity()
..setEntry(3, 2, 0.002)
..rotateX(3.14 * _animation.value),
child: GestureDetector(
onTap: () {
if (_animationStatus == AnimationStatus.dismissed) {
_animationController.forward();
} else {
_animationController.reverse();
}
},
child: _animation.value <= 0.5
? Container(
color: Colors.blueAccent,
width: 200,
height: 200,
child: Icon(
Icons.ac_unit,
color: Colors.white,
size: 50,
),
)
: Container(
color: Colors.red,
width: 200,
height: 200,
child: Icon(
Icons.ac_unit,
color: Colors.white,
size: 50,
),
),
),
),
),
),
Card(
margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
child: ListTile(
leading: Icon(
Icons.phone,
color: Colors.teal,
),
title: Text(
'+44 123 456 789',
style: TextStyle(
color: Colors.teal.shade900,
fontFamily: 'Source Sans Pro',
fontSize: 20.0,
),
),
)),
Card(
margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
child: ListTile(
leading: Icon(
Icons.email,
color: Colors.teal,
),
title: Text(
'angela@email.com',
style: TextStyle(
fontSize: 20.0,
color: Colors.teal.shade900,
fontFamily: 'Source Sans Pro'),
),
))
],
)),
);
}
}



 */
