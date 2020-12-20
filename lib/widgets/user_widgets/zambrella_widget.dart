part of user_widgets;

//user defines from abstract class needed information
class Zambrella extends WidgetInfo {
  get name => 'Doug \"Zambrella\" Todd';
  get description =>
      "DOTA player | Flutter Developer | Biochemistry Graduate | Tech Enthusiast | Metal Music Lover";
  get developer => "Doug Todd"; //use any name for yourself
  get widget => ZambrellaWidget();
}

Zambrella zambrella = Zambrella();

// User's widget lives here
class ZambrellaWidget extends StatefulWidget {
  @override
  _ZambrellaWidgetState createState() => _ZambrellaWidgetState();
}

class _ZambrellaWidgetState extends State<ZambrellaWidget> {
  static const Color _accentColor = Color(0xffff0000);

  static const Color _secondaryAccentColor = Color(0xffaf0404);

  static const Color _darkPrimary = Color(0xff252525);

  static const Color _darkSecondary = Color(0xff414141);

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
        backgroundColor: _darkPrimary,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          // Set the notification text to black
          value: SystemUiOverlayStyle.light,
          // Stop the widgets from overflowing into notification area
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _accentColor,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _accentColor.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/profile_images/Zambrella_profile.jpg',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    zambrella.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '🇬🇧 United Kingdom',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButtonPlain(
                        icon: FontAwesomeIcons.github,
                        link: 'https://github.com/Zambrella',
                        borderColor: _darkSecondary,
                      ),
                      SocialButtonPlain(
                        icon: FontAwesomeIcons.twitter,
                        link: 'https://twitter.com/Zambrella101',
                        borderColor: _darkSecondary,
                      ),
                      SocialButtonPlain(
                        icon: FontAwesomeIcons.linkedin,
                        link:
                            'https://www.linkedin.com/in/douglas-todd-105b79b0/',
                        borderColor: _darkSecondary,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text('Twitter: @Zambrella101'),
                  Text('GitHub: @Zambrella'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButtonPlain extends StatelessWidget {
  final Color borderColor;
  final IconData icon;
  final String link;

  const SocialButtonPlain(
      {@required this.borderColor, @required this.icon, @required this.link});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () async {
          await launch(link);
        },
        child: Container(
          padding: EdgeInsets.all(8),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}

// class SocialButton extends StatefulWidget {
//   final Color inactiveColor;
//   final Color activeColor;
//   final Widget icon;
//   final String link;

//   SocialButton(
//       {@required this.inactiveColor,
//       @required this.activeColor,
//       @required this.icon,
//       this.link});

//   @override
//   _SocialButtonState createState() => _SocialButtonState();
// }

// class _SocialButtonState extends State<SocialButton> {
//   bool isPressed = false;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) async {
//         setState(() {
//           isPressed = true;
//         });
//         await launch(widget.link);
//       },
//       onTapUp: (_) {
//         setState(() {
//           isPressed = false;
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.all(4),
//         clipBehavior: Clip.hardEdge,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//                 color: isPressed
//                     ? widget.activeColor.withOpacity(0.5)
//                     : Colors.transparent,
//                 spreadRadius: 3,
//                 blurRadius: 4),
//           ],
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: isPressed ? widget.activeColor : widget.inactiveColor,
//             width: 2,
//           ),
//         ),
//         child: widget.icon,
//       ),
//     );
//   }
// }
