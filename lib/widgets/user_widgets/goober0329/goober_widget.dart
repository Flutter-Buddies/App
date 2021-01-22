part of user_widgets;

class Goober extends WidgetInfo {
  get name => "Grayson's Developer Widget";
  get description => "Materials Engineer | Avid Cyclist | "
      "Programming Enthusiast | Adventure Seeker";
  get developer => "Grayson Harrington";
  get logoPath => "assets/profile_images/harrington_profile.jpg";
  get widget => GooberWidget();
}

Goober goober = Goober();

final Color backgroundColor = Colors.white;

final Color golColor = Color(0xFF00DE59);
final double golCornerRadiusRatio = 0.25;

/// My Developer Widget
class GooberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  // AVATAR DISPLAY
                  AvatarDisplay(),
                  WidgetTileDivider(),
                  // ABOUT ME
                  AboutMe(),
                  WidgetTileDivider(),
                  // CONWAY'S GAME OF LIFE
                  WidgetTile(
                    text: "John Conway's Game of Life",
                    widget: GoLWidget(
                      size: MediaQuery.of(context).size.width * 0.6,
                    ),
                  ),
                  WidgetTileDivider(),
                  // GOL GLIDER
                  WidgetTile(
                    text: "Game of Life Glider Animation",
                    widget: Center(
                      child: GoLGlider(
                        gliderSize: MediaQuery.of(context).size.width * 0.6,
                        color: golColor,
                        borderRadiusRatio: golCornerRadiusRatio,
                      ),
                    ),
                  ),
                  WidgetTileDivider(),
                  WidgetTile(
                    text: "To be continued",
                    widget: Icon(
                      Icons.more_horiz,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tile to be used in my ListView of favorite widgets
class WidgetTile extends StatelessWidget {
  final Widget widget;
  final String text;
  WidgetTile({@required this.widget, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        widget,
      ],
    );
  }
}

/// Divider between the ListView WidgetTiles
class WidgetTileDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 40.0,
      thickness: 1,
      color: Colors.black,
      indent: 50,
      endIndent: 50,
    );
  }
}

/// AboutMe portion of the ListView
class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        "I graduated from Iowa State University with a degree in Materials Engineering."
        " Along with my interest for Materials Engineering I also actively pursue"
        " my interest in programming. Recently I started learning Flutter in my"
        " spare time and I have really loved the language."
        "\n\nBelow are some of my favorite widgets that I have made while working on "
        "different projects."
        "\nEnjoy!",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// AvatarDisplay portion of ListView
class AvatarDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(goober.logoPath),
              radius: 80,
            ),
          ),
        ),
        Center(
          child: Text(
            goober.developer,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              goober.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
