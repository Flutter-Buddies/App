part of user_widgets;

class Slovnicki extends WidgetInfo {
  @override
  String get name => 'Sandro Lovnički\n@sly, @slovnicki';

  @override
  String get description =>
      'Computer Scientist, Mathematician, Software Engineer, Flutter Enthusiast';

  @override
  String get developer => 'Sandro Lovnički';

  @override
  String get logoPath => 'assets/profile_images/slovnicki_profile.jpeg';

  @override
  Widget get widget => SlovnickiWidget();

  @override
  int projectsCount = 2;
}

Slovnicki slovnicki = Slovnicki();

class SlovnickiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF600000),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: kToolbarHeight + 32.0),
              CircleAvatar(
                backgroundImage: AssetImage(slovnicki.logoPath),
                radius: 60,
              ),
              Text(
                slovnicki.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: _textSpan(),
              ),
              SizedBox(height: 8.0),
              RichText(
                text: TextSpan(
                  text: 'https://github.com/slovnicki',
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launch('https://github.com/slovnicki'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '''I studied (and finished) Computer Science and Mathematics in Zagreb, Croatia.

I am the creator of pLam - a programming language for studying and exploring pure λ-calculus.

Lately, I am very passionate about Dart and Flutter to which I contribute by developing packages and paving the road for Flutter web and desktop.

I would like to build an AI to peacefully rule the world or invent a new model of computation.''',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'More coming soon... this is just a test',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textSpan() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: 'Computer Scientist',
          ),
          TextSpan(
            text: ' && ',
            style: TextStyle(
              color: Color(0xFF9E9E9E),
            ),
          ),
          TextSpan(
            text: 'Mathematician',
          ),
          TextSpan(
            text: ' && ',
            style: TextStyle(
              color: Color(0xFF9E9E9E),
            ),
          ),
          TextSpan(
            text: 'Software Engineer',
          ),
          TextSpan(
            text: ' && ',
            style: TextStyle(
              color: Color(0xFF9E9E9E),
            ),
          ),
          TextSpan(
            text: 'Flutter Enthusiast',
          ),
        ],
      ),
    );
  }
}
