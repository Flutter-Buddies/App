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

class GooberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                  avatarDisplay(),
                  divider(),
                  aboutMe(),
                  divider(),
                  widgetDisplay(
                    text: "Game of Life Glider Animation",
                    widget: Center(
                      child: GoLGlider(
                        gliderSize: MediaQuery.of(context).size.width * 0.6,
                        color: Color(0xFF00DE59),
                        moduleCornerRadius: 0.4,
                      ),
                    ),
                  ),
                  divider(),
                  Center(child: Text("TODO")),
                  divider(),
                  Center(child: Text("TODO")),
                  divider(),
                  Center(child: Text("TODO")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget widgetDisplay({String text = "", @required Widget widget}) {
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

Divider divider() {
  return Divider(
    height: 40.0,
    thickness: 1,
    color: Colors.black,
    indent: 50,
    endIndent: 50,
  );
}

Widget aboutMe() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Text(
      "I graduated from Iowa State University with a degree in Materials Engineering."
      " Along with my interest for Materials Engineering I also actively pursue"
      " my interest in programming. Recently I started learning Flutter in my"
      " spare time and I have really loved the language."
      "\n\nBelow are some of the widgets I have made while working on "
      "different apps and projects."
      "\nEnjoy!",
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    ),
  );
}

Widget avatarDisplay() {
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
