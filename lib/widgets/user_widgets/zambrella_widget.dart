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
        accentColor: _accentColor,
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
            // Todo: Add sliver app bar or just app bar so iOS can go back
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
                          borderColor: _secondaryAccentColor,
                        ),
                        SocialButtonPlain(
                          icon: FontAwesomeIcons.twitter,
                          link: 'https://twitter.com/Zambrella101',
                          borderColor: _secondaryAccentColor,
                        ),
                        SocialButtonPlain(
                          icon: FontAwesomeIcons.linkedin,
                          link:
                              'https://www.linkedin.com/in/douglas-todd-105b79b0/',
                          borderColor: _secondaryAccentColor,
                        ),
                        SocialButtonPlain(
                          icon: FontAwesomeIcons.spotify,
                          link:
                              'https://open.spotify.com/playlist/6vq0QI9OeGMmr7yqbnE7Xx?si=mx2AF8HfRvStFi1Bgkfd1A',
                          borderColor: _secondaryAccentColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InfoSection(
                      title: 'About',
                      body: """
I studied biochemistry at Bath univeristy, after which I became a DOTA 2 caster. Through casting I met the founders of an esports startup where I have spent the last 4 years running their marketing and growth. I am now looking for a job as a Flutter developer.
                    """,
                      dividerColor: _darkSecondary,
                      icon: Icons.info,
                      iconColor: _accentColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoSection(
                      title: 'My Flutter journey',
                      body: """
I started my Flutter journey almost 2 years ago after I expressed an interest in programming and a colleague suggested Angela's course on Udemy. I've been learning on and off but I am now ready to take it to the next level and become an app developer full time! 
                    """,
                      dividerColor: _darkSecondary,
                      icon: Icons.code,
                      iconColor: _accentColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoSection(
                      title: 'Skills',
                      body: """
- Flutter app development
- Online marketing
- Designing ad creatives
- User analytics
- UI/UX
- Prototyping
- Metal music production
- Biochemistry
                    """,
                      dividerColor: _darkSecondary,
                      icon: Icons.flash_on,
                      iconColor: _accentColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoSection(
                      title: 'Interests',
                      body: """
- Gaming
- Esports (mainly DOTA 2)
- Metal music & production
- Technology
                    """,
                      dividerColor: _darkSecondary,
                      icon: Icons.person,
                      iconColor: _accentColor,
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
  final Color iconColor;
  final String link;

  const SocialButtonPlain(
      {@required this.borderColor,
      @required this.icon,
      @required this.link,
      this.iconColor});
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
          padding: EdgeInsets.all(10),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
          ),
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final String title;
  final String body;
  final IconData icon;
  final Color iconColor;
  final Color dividerColor;
  InfoSection(
      {this.title, this.body, this.dividerColor, this.icon, this.iconColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: iconColor ?? Colors.white,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            alignment: Alignment.centerLeft,
          ),
          Divider(
            color: dividerColor,
            thickness: 2,
          ),
          Text(
            body,
            textAlign: TextAlign.left,
          )
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
