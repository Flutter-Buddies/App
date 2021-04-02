part of user_widgets;

class Robots extends WidgetInfo {
  @override
  String get name => 'Robots'; //name your widget, not used in design currently

  @override
  String get description => 'Flutter Developer';

  @override
  String get developer => 'Kris Skotheim'; //use any name for yourself

  @override
  String get logoPath => 'assets/profile_images/robots_avatar_min.png';

  @override
  Widget get widget => RobotsProfile();
}

Robots robots = Robots();

class RobotsProfile extends StatefulWidget {
  @override
  _RobotsProfileState createState() => _RobotsProfileState();
}

class _RobotsProfileState extends State<RobotsProfile> {
  RobotsBloc bloc;
  Timer mainTimer;
  MonsterController monsterController;

  @override
  void initState() {
    _startBloc();
    mainTimer = Timer.periodic(
        const Duration(
          milliseconds: 100,
          microseconds: 38,
        ), (timer) {
      monsterController.tick();
      bloc.computeTimestep();
    });
    super.initState();
  }

  void _startBloc() {
    bloc = RobotsBloc();
    monsterController = MonsterController(bloc);
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        Size size = MediaQuery.of(context).size;
        bloc.resizeScreen(
          size.width,
          size.height,
        );
        bloc.moveRobot(size.width * .5);
      },
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    mainTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        bloc.resizeScreen(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        );
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Expanded(
                child: StreamBuilder<RobotsState>(
                    stream: bloc.stateStream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      RobotsState state = snapshot.data;
                      return Stack(
                        children: [
                          _secrets(state.level),
                          _robot(state),
                          ...state.missiles.map(_redMissile).toList(),
                          ...state.monsters.map(_monster).toList(),
                          ...state.monsterMissiles.map(_blueMissile).toList(),
                          _hud(state),
                          if (state.laser.active) _laser(state),
                          if (state.gameOver || state.robotDestroyed)
                            _gameOver(),
                          if (state.upgradeAvailable)
                            UpgradeButtons(
                              bloc: bloc,
                            ),
                        ],
                      );
                    }),
              ),
              BottomRowButtons(bloc: bloc),
            ],
          ),
        );
      },
    );
  }

  Widget _secrets(int level) {
    return Positioned(
      top: 20,
      right: 20,
      width: 200,
      // height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(robots.logoPath),
              radius: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                (level < RobotsSecrets.SECRETS.length
                    ? RobotsSecrets.SECRETS[level - 1]
                    : RobotsSecrets.SECRETS.last),
                style: whiteStyle,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _laser(RobotsState state) => Positioned(
        bottom: RobotsBloc.ROBOT_HEIGHT + 15,
        height: state.screenY,
        left: state.laser.xPos - 5,
        width: 10,
        child: Container(
          width: 10,
          height: state.screenY - RobotsBloc.ROBOT_HEIGHT,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow.shade50,
                Colors.orange,
                Colors.yellow.shade50
              ],
              stops: [0.0, .5, 1.0],
            ),
          ),
          // color: Colors.yellow,
        ),
      );

  Widget _robot(RobotsState state) => Positioned(
        left: state.robotPosition - 10,
        width: 20,
        bottom: RobotsBloc.ROBOT_HEIGHT,
        height: 15,
        child: RobotSprite(
          state.robotDestroyed,
          bloc: bloc,
        ),
      );

  Widget _redMissile(Missile m) => Positioned(
        left: m.x,
        bottom: m.y,
        height: 11,
        width: 5,
        child: Column(
          children: [
            Container(
              width: 3,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Container(
              width: 5,
              height: 3,
              decoration: BoxDecoration(
                color: _randomMissileColor,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      );

  Widget _blueMissile(Missile e) => Positioned(
        left: e.x,
        bottom: e.y,
        height: 11,
        width: 5,
        child: Column(
          children: [
            Container(
              width: 5,
              height: 3,
              decoration: BoxDecoration(
                color: _randomMissileColor,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Container(
              width: 3,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      );

  Color get _randomMissileColor =>
      Missile.MISSILE_COLORS[Random().nextInt(Missile.MISSILE_COLORS.length)];

  Widget _monster(Monster e) => Positioned(
        left: e.x - 10,
        bottom: e.y - 10,
        height: e.size,
        width: e.size,
        child: Container(
          width: e.size,
          height: e.size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.lerp(
                  Colors.red, Colors.white, e.health * (1.0 / e.maxHealth))),
        ),
      );

  Widget _gameOver() => Center(
        child: Text(
          'Game Over',
          style: TextStyle(color: Colors.white),
        ),
      );

  Widget _hud(RobotsState state) => Positioned(
        bottom: 10,
        height: 100,
        left: 10,
        width: 100,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Defeated: ${state.monstersDefeated}',
                  style: whiteStyle,
                ),
                Text(
                  'Health: ${state.robotHealth}',
                  style: whiteStyle,
                ),
                Text(
                  'Level: ${state.level}',
                  style: whiteStyle,
                ),
              ],
            ),
          ),
        ),
      );

  static const TextStyle whiteStyle = TextStyle(color: Colors.white);
}

class UpgradeButtons extends StatelessWidget {
  final RobotsBloc bloc;

  const UpgradeButtons({Key key, this.bloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Pick Upgrade:', style: blueStyle),
          Container(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UpgradeButton(
                'fire rate',
                onPressed: () => bloc.pickUpgrade(Upgrade.fireRate),
              ),
              Container(width: 20),
              UpgradeButton(
                'cannons',
                onPressed: () => bloc.pickUpgrade(Upgrade.cannons),
              ),
              Container(width: 20),
              UpgradeButton(
                'health',
                onPressed: () => bloc.pickUpgrade(Upgrade.health),
              )
            ],
          ),
        ],
      ),
    );
  }

  static const TextStyle blueStyle = TextStyle(color: Colors.lightBlue);
}

class UpgradeButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const UpgradeButton(
    this.text, {
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.withAlpha(50),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: yellowStyle),
      ),
    );
  }

  static const TextStyle yellowStyle = TextStyle(color: Colors.yellowAccent);
}

class RobotSprite extends StatelessWidget {
  final RobotsBloc bloc;
  final bool destroyed;

  const RobotSprite(this.destroyed, {Key key, this.bloc}) : super(key: key);

  Color get sideColor => bloc.state.robotVelocity == 0
      ? Colors.lightBlue
      : bloc.state.robotVelocity > 0
          ? Colors.orange.shade800
          : Colors.green.shade800;
  Color get topColor => bloc.state.robotVelocity == 0
      ? Colors.lightBlue
      : bloc.state.robotVelocity < 0
          ? Colors.orange.shade800
          : Colors.green.shade800;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: destroyed ? Colors.grey : Colors.green,
          width: 2,
        ),
        color: destroyed ? Colors.grey : Colors.blue,
      ),
      child: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: topColor,
            width: 8,
            height: 2,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: sideColor,
            width: 3,
            height: 6,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: topColor,
            width: 8,
            height: 2,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            color: sideColor,
            width: 3,
            height: 6,
          ),
        ),
      ]),
    );
  }
}

class BottomRowButtons extends StatelessWidget {
  final RobotsBloc bloc;

  const BottomRowButtons({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: StreamBuilder<RobotsState>(
          stream: bloc.stateStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            RobotsState state = snapshot.data;
            int now = DateTime.now().millisecondsSinceEpoch;
            return
                // use this if running on web / desktop:
                // RawKeyboardListener(
                //   autofocus: true,
                //   focusNode: FocusNode(),
                //   onKey: _processKeystroke,
                //   child:
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_left,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () =>
                      state.robotDestroyed ? null : bloc.incRobotVelocity(-1),
                ),
                if (bloc.state.level > 1)
                  IconButton(
                    icon: Icon(
                      Icons.computer,
                      color: Color.lerp(
                        Colors.black,
                        Colors.white,
                        min(
                          (now - state.laser.timeFired) /
                              RobotsBloc.LASER_FIRE_RATE,
                          1,
                        ),
                      ),
                      size: 30,
                    ),
                    onPressed: () =>
                        bloc.state.robotDestroyed ? null : bloc.fireLaser(),
                  ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => bloc.state.robotDestroyed
                      ? null
                      : bloc.incRobotVelocity(1),
                ),
              ],
              // ),
            );
          }),
    );
  }
}
