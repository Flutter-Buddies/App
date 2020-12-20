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
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    ProfileImage(
                      accentColor: _accentColor,
                    ),
                    Text(
                      zambrella.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    InfoSection(
                      title: 'About',
                      body:
                          """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    """,
                      dividerColor: _darkSecondary,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoSection(
                      title: 'Skills',
                      body:
                          """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    """,
                      dividerColor: _darkSecondary,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoSection(
                      title: 'Interests',
                      body:
                          """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    """,
                      dividerColor: _darkSecondary,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//* Custom widgets below
class ProfileImage extends StatefulWidget {
  final Color accentColor;
  ProfileImage({@required this.accentColor});

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 10.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: widget.accentColor,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: widget.accentColor.withOpacity(0.5),
            spreadRadius: _animation.value,
            blurRadius: _animation.value,
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/profile_images/Zambrella_profile.jpg',
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

class InfoSection extends StatelessWidget {
  final String title;
  final String body;
  final Color dividerColor;
  InfoSection({this.title, this.body, this.dividerColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Align(
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.centerLeft,
          ),
          Divider(
            color: dividerColor,
            thickness: 2,
          ),
          Text(body)
        ],
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
