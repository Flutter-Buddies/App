import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  // Those values are used to animate the text card
  double opacity = 1.0;
  double height = 195.0;
  // This variable is used to test if the text card
  int textNumber = 0;
  static String _textZero =
      "After spending 12 years in the professional audio universe, I made a conversion to the world of software development. \r\n \r\nBeing a boardgame geek made me a problem solver, I think that's why I love code so much. \r\nI really see it has problems to solve to win the game. \r\n \r\nWhich is fun as life can be !";
  static String _textOne =
      "In my free time my main passions are boardgames, playing music, creating music, developing with Flutter, and of course spending time with my loved family.";
  static String _textTwo =
      "My projects are to become a better developer, help my son to grow the best way will fit him, and love my wife as much as I can.\r\nOf course all of this without forgetting my friends and family.";
  var texts = <String>[_textZero, _textOne, _textTwo];
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textController.text = texts[textNumber];
    final size = MediaQuery.of(context).size;
    return Expanded(
      flex: 1,
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              margin: EdgeInsets.all(16.0),
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pierre-emmanuel Legrain\r\n.NET Software Engineer & Flutter maniac",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(16.0),
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  height: height,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    opacity: opacity,
                    child: Text(
                      _textController.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        icon: Icon(Icons.backpack),
                        onPressed: () async {
                          if (textNumber != 0) {
                            setState(() {
                              opacity = 0.0;
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            setState(() {
                              height = 195.0;
                              opacity = 1.0;
                            });
                            textNumber = 0;
                          }
                        }),
                    IconButton(
                        icon: Icon(Icons.casino),
                        onPressed: () async {
                          if (textNumber != 1) {
                            setState(() {
                              opacity = 0.0;
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            setState(() {
                              height = 80.0;
                              opacity = 1.0;
                            });
                          }
                          textNumber = 1;
                        }),
                    IconButton(
                      icon: Icon(Icons.dashboard),
                      onPressed: () async {
                        if (textNumber != 2) {
                          setState(() {
                            opacity = 0.0;
                          });
                          await Future.delayed(
                              const Duration(milliseconds: 500));
                          setState(() {
                            height = 100.0;
                            opacity = 1.0;
                          });
                          textNumber = 2;
                        }
                      },
                    ),
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
