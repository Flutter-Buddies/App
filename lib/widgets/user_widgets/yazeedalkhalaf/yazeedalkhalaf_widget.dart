part of user_widgets;

class YazeedAlKhalaf extends WidgetInfo {
  @override
  String get name => 'Yazeed AlKhalaf';

  @override
  String get description =>
      "Flutter Developer 🚀 | Youngest Participant in Hajj Hackathon, World's Largest Hackathon!";

  @override
  String get developer => 'Yazeed AlKhalaf';

  @override
  String get logoPath => 'assets/profile_images/yazeedalkhalaf_profile.jpg';

  @override
  Widget get widget => YazeedAlKhalafWidget();
}

final YazeedAlKhalaf yazeedAlKhalaf = YazeedAlKhalaf();

class YazeedAlKhalafWidget extends StatefulWidget {
  @override
  _YazeedAlKhalafWidgetState createState() => _YazeedAlKhalafWidgetState();
}

class _YazeedAlKhalafWidgetState extends State<YazeedAlKhalafWidget> {
  bool isLeftHovering = false;
  bool isRightHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isLeftHovering = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isLeftHovering = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff528DF5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isLeftHovering ? 360 : 350,
                        height: isLeftHovering ? 60 : 50,
                        child: Center(
                          child: Text(
                            '16 years old',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      yazeedAlKhalaf.logoPath,
                      fit: BoxFit.fitHeight,
                      height: 350,
                    ),
                  ),
                ),
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isRightHovering = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isRightHovering = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff528DF5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isRightHovering ? 360 : 350,
                        height: isRightHovering ? 60 : 50,
                        child: Center(
                          child: Text(
                            'Flutter Developer',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              yazeedAlKhalaf.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 350,
              child: Text(
                yazeedAlKhalaf.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff909090),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.github,
                    ),
                    onPressed: () async {
                      await launch('https://github.com/YazeedAlKhalaf');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      color: Color(0xff33A1EE),
                    ),
                    onPressed: () async {
                      await launch('https://twitter.com/YazeedAlKhalaf');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.youtube,
                      color: Color(0xffFA0014),
                    ),
                    onPressed: () async {
                      await launch(
                          'https://www.youtube.com/channel/UCKl9vaVnPf17yOnizbYgEzg');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(120, 60),
                    ),
                    child: Text(
                      'Chat',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff262626),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 60),
                      primary: Color(0xff5C56F9),
                    ),
                    child: Text(
                      'Message',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
