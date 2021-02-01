part of user_widgets;

class Hsinats extends WidgetInfo {
  get name => "Paul's Developer Widget";
  get description => "Chemist | Educator | Flutter Developer";
  get developer => "Paul Stanish";
  get logoPath => "assets/profile_images/hsinats_profile.jpg";
  get widget => HsinatsWidget();
}

Hsinats hsinats = Hsinats();

String myStory = '''
I have a Ph.D. in chemistry from the University of Waterloo. I love talking about science and am currently designing cirricula for an e-learning startup.

I love Flutter because it has allowed me make the ideas in my head a real thing.
''';

// TODO only works in landscape
class HsinatsWidget extends StatelessWidget {
  final Radius bodyRadius = Radius.circular(16);
  final double dividerIndent = 12;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Image(image: AssetImage("assets/global_images/quantum_dots.jpg")),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height - size.width / 16 * 9 * 0.6 - 88,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: bodyRadius,
                    topRight: bodyRadius,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 68,
                    ),
                    Text(
                      hsinats.developer,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(hsinats.description),
                    Divider(
                      color: Colors.red,
                      indent: dividerIndent,
                      endIndent: dividerIndent,
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          myStory,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildAvatar(size),
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.grey[300]),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }

  Positioned buildAvatar(Size size) {
    return Positioned(
      top: size.width / 16 * 9 * .6,
      left: size.width / 2 - 60,
      child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 8.0),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image(
              image: AssetImage(hsinats.logoPath),
            ),
          )
          // CircleAvatar(
          //   backgroundImage: AssetImage(hsinats.logoPath),
          //   radius: 60,
          // ),
          ),
    );
  }
}
