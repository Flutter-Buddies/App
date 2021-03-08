part of user_widgets;

class Sleepingisimportant extends WidgetInfo {
  get name =>
      'Sleepingisimportant'; //name your widget, not used in design currently
  get description =>
      "Flutter beginner | Cat's Slave | Bubble Teaholic | Meme Lover";
  get developer => "Alice Woo"; //use any name for yourself
  get logoPath => "assets/profile_images/sleepingisimportant_profile.jpg";
  get widget => SleepingisimportantWidget();
}

Sleepingisimportant sleepingisimportant = Sleepingisimportant();

class SleepingisimportantWidget extends StatefulWidget {
  @override
  _SleepingisimportantWidgetState createState() =>
      _SleepingisimportantWidgetState();
}

class _SleepingisimportantWidgetState extends State<SleepingisimportantWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation1;
  Animation<Offset> _animation2;
  bool hintText = false;
  // bool unlockContent = false;

  int waveHeightIndexInt = 10;

  @override
  void initState() {
    super.initState();

    // waveHeightIndex = 1;

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )
      ..repeat(reverse: false)
      ..addListener(() {
        setState(() {
          _controller.value < 0.5 ? hintText = false : hintText = true;
        });
      });

    _animation1 = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.slowMiddle,
      ),
    );
    _animation2 = Tween<Offset>(
      begin: Offset(1, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.slowMiddle,
      ),
    );
  }

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.grey),
        ),
        body: Stack(
          children: [
            SlideTransition(
              position: _animation1,
              child: Stack(
                children: [
                  Container(
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height),
                      painter: WaterWaveBlue(
                          waveHeightIndex: 0.1 * waveHeightIndexInt),
                    ),
                  ),
                  Container(
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height),
                      painter: WaterWaveLightBlue(
                          waveHeightIndex: 0.1 * waveHeightIndexInt),
                    ),
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: _animation2,
              child: Stack(
                children: [
                  Container(
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height),
                      painter: WaterWaveBlue(
                          waveHeightIndex: 0.1 * waveHeightIndexInt),
                    ),
                  ),
                  Container(
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height),
                      painter: WaterWaveLightBlue(
                          waveHeightIndex: 0.1 * waveHeightIndexInt),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: waveHeightIndexInt == -1 ? 0.0 : 1.0,
              duration: Duration(milliseconds: 800),
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(
                    top: 0.05 * MediaQuery.of(context).size.height),
                padding: EdgeInsets.symmetric(
                  horizontal: 0.15 * MediaQuery.of(context).size.width,
                ),
                child: Text(
                  sleepingisimportant.developer,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 0.1 * MediaQuery.of(context).size.width,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    top: 0.1 * MediaQuery.of(context).size.height,
                    left: 0.1 * MediaQuery.of(context).size.width,
                    right: 0.1 * MediaQuery.of(context).size.width,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedSize(
                              duration: Duration(milliseconds: 1500),
                              curve: Curves.fastOutSlowIn,
                              vsync: this,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image:
                                      AssetImage(sleepingisimportant.logoPath),
                                  width: waveHeightIndexInt == -1
                                      ? 0.3 * MediaQuery.of(context).size.width
                                      : 0,
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    0.04 * MediaQuery.of(context).size.width),
                            AnimatedOpacity(
                              opacity: waveHeightIndexInt == -1 ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 1000),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () => launch(
                                        'https://github.com/Sleepingisimportant'),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/global_images/GitHub-Logo-Shadowed.png"),
                                      width: 0.05 *
                                          MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                  Text(
                                    sleepingisimportant.developer,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 0.1 *
                                          MediaQuery.of(context).size.width,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),

                      // if (waveHeightIndexInt == -1)
                      AnimatedOpacity(
                        opacity: waveHeightIndexInt == -1 ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 1000),
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    0.025 * MediaQuery.of(context).size.height),
                            Text(
                              sleepingisimportant.description,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize:
                                    0.05 * MediaQuery.of(context).size.width,
                                color: Colors.black38,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                                height:
                                    0.015 * MediaQuery.of(context).size.height),
                            Divider(
                                color: Colors.black54,
                                height:
                                    0.015 * MediaQuery.of(context).size.height),
                            Container(
                              height: 0.5 * MediaQuery.of(context).size.height,
                              child: SingleChildScrollView(
                                // scrollDirection: Axis.vertical,

                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 0.01 *
                                            MediaQuery.of(context).size.height),
                                    Text(
                                      """
Not coming from any STEM subjects but interested in any tech topics.

Started my programming journey on my own since last year October, and fell in love with Flutter.

Learning new stuff alone is never fun, thus, I hope that I can get to meet some learning buddies in Flutter Buddies Group.

To be continued....""",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 0.04 *
                                            MediaQuery.of(context).size.width,
                                        color: Colors.black54,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(
                horizontal: 0.15 * MediaQuery.of(context).size.width,
                vertical: 0.07 * MediaQuery.of(context).size.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 0.14 * MediaQuery.of(context).size.width,
                    height: 0.07 * MediaQuery.of(context).size.height,
                    child: FloatingActionButton(
                      heroTag: "btnDecrease",
                      onPressed: () {
                        setState(() {
                          print("yes");
                          print(waveHeightIndexInt);
                          waveHeightIndexInt = waveHeightIndexInt + 1;

                          if (waveHeightIndexInt > 10) {
                            waveHeightIndexInt = 10;
                          }
                        });
                      },
                      backgroundColor: Colors.white,
                      elevation: 2.0,
                      child: Icon(
                        Icons.undo,
                        color: Colors.grey,
                        size: 0.07 * MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 0.03 * MediaQuery.of(context).size.width,
                  // ),
                  SizedBox(
                    width: 0.28 * MediaQuery.of(context).size.width,
                    height: 0.15 * MediaQuery.of(context).size.height,
                    child: FloatingActionButton(
                      heroTag: "btnIncrease",
                      onPressed: () {
                        setState(() {
                          print(waveHeightIndexInt);
                          waveHeightIndexInt = waveHeightIndexInt - 1;

                          if (waveHeightIndexInt < -1) {
                            waveHeightIndexInt = -1;
                          }
                        });
                      },
                      backgroundColor: Color(0xff6BAFEE),
                      elevation: 2.0,
                      child: Icon(
                        Icons.add,
                        color: Color(0xffffffff),
                        size: 0.15 * MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              right: hintText
                  ? 0.5 * MediaQuery.of(context).size.width
                  : 0.45 * MediaQuery.of(context).size.width,
              top: 0.73 * MediaQuery.of(context).size.height,
              duration: Duration(milliseconds: 1500),
              curve: Curves.fastOutSlowIn,
              child: AnimatedOpacity(
                opacity: waveHeightIndexInt == 10 ? 1.0 : 0.0,
                duration: Duration(milliseconds: 600),
                child: Row(
                  children: [
                    Text(
                      '''
Fill up the water to 
unlock the whole content''',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 0.035 * MediaQuery.of(context).size.width,
                        color: Colors.black54,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaterWaveBlue extends CustomPainter {
  final double waveHeightIndex;
  WaterWaveBlue({@required this.waveHeightIndex});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xffe1effc);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * (waveHeightIndex + 0.06));
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * (waveHeightIndex - 0.07),
      size.width * 0.90,
      size.height * waveHeightIndex,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * (waveHeightIndex + 0.07),
      size.width * 1.0,
      size.height,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class WaterWaveLightBlue extends CustomPainter {
  final double waveHeightIndex;
  WaterWaveLightBlue({@required this.waveHeightIndex});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0XFFb3d7f6);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * waveHeightIndex);
    path.quadraticBezierTo(
        size.width * 0.25,
        size.height * (waveHeightIndex + 0.045),
        size.width * 0.5,
        size.height * waveHeightIndex);
    path.quadraticBezierTo(
        size.width * 0.75,
        size.height * (waveHeightIndex - 0.045),
        size.width * 1.0,
        size.height * waveHeightIndex);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
