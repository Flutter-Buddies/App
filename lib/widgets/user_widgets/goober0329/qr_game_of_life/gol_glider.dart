import 'package:flutter/material.dart';
import 'package:flutter_buddies/widgets/user_widgets/user_widgets.dart';

/// Stateful Widget to control the glider animation
/// that will go on the splash screen and loading screens
class GoLGlider extends StatefulWidget {
  final List<List<int>> modulePositions = [
    [0, 1],
    [1, 2],
    [2, 2],
    [2, 1],
    [2, 0]
  ];

  final List<List<List<int>>> modulePositionStateChange = [
    [
      [1, -1],
      [0, 0],
      [0, 0],
      [0, 0],
      [1, 1]
    ],
    [
      [1, 0],
      [0, 0],
      [0, 0],
      [1, 1],
      [0, 0]
    ],
    [
      [-1, 1],
      [1, 1],
      [0, 0],
      [0, 0],
      [0, 0]
    ],
    [
      [0, 1],
      [0, 0],
      [1, 1],
      [0, 0],
      [0, 0]
    ],
  ];
  final double gliderSize;
  final Duration duration;
  final Color color;
  final double borderRadiusRatio;

  GoLGlider({
    @required this.gliderSize,
    this.duration = const Duration(milliseconds: 1500),
    @required this.color,
    @required this.borderRadiusRatio,
  });

  @override
  _GoLGliderState createState() => _GoLGliderState();
}

class _GoLGliderState extends State<GoLGlider>
    with SingleTickerProviderStateMixin {
  List<List<int>> modulePositions;
  double moduleSize;
  Container module;

  double gliderOffInit;
  Animation gliderOff;

  int curState;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    modulePositions = widget.modulePositions;
    moduleSize = widget.gliderSize / 5;
    module = Container(
      width: widget.gliderSize / 5,
      height: widget.gliderSize / 5,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(
          widget.borderRadiusRatio * widget.gliderSize / 5,
        ),
      ),
    );

    gliderOffInit = widget.gliderSize / 2 - moduleSize * 3 / 2;

    curState = -1;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 4),
    );

    gliderOff = Tween<double>(
      begin: 0,
      end: moduleSize / 4,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: Curves.linear),
      ),
    );

    _controller.addListener(updateModulePositions);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// this is where the meat of the animation occurs. the glider as a whole
  /// moves toward the top left corner based on the controller value, and the
  /// glider transitions through its four states during that period of time too.
  void updateModulePositions() {
    // TODO things are wrong
    if (_controller.isCompleted) {
      int oldState = curState;
      curState = (curState + 1) % 4;
      int nextIter = (curState == 0 && oldState == 3) ? 1 : 0;
      for (int i = 0; i < modulePositions.length; i++) {
        modulePositions[i][0] +=
            widget.modulePositionStateChange[curState][i][0] - nextIter;
        modulePositions[i][1] +=
            widget.modulePositionStateChange[curState][i][1] - nextIter;
      }
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double gliderOffTrue =
                gliderOffInit - gliderOff.value - curState * moduleSize / 4;
            return Container(
              width: widget.gliderSize,
              height: widget.gliderSize,
              child: Stack(
                children: [
                  Positioned(
                    left: modulePositions[0][0] * moduleSize + gliderOffTrue,
                    top: modulePositions[0][1] * moduleSize + gliderOffTrue,
                    child: module,
                  ),
                  Positioned(
                    left: modulePositions[1][0] * moduleSize + gliderOffTrue,
                    top: modulePositions[1][1] * moduleSize + gliderOffTrue,
                    child: module,
                  ),
                  Positioned(
                    left: modulePositions[2][0] * moduleSize + gliderOffTrue,
                    top: modulePositions[2][1] * moduleSize + gliderOffTrue,
                    child: module,
                  ),
                  Positioned(
                    left: modulePositions[3][0] * moduleSize + gliderOffTrue,
                    top: modulePositions[3][1] * moduleSize + gliderOffTrue,
                    child: module,
                  ),
                  Positioned(
                    left: modulePositions[4][0] * moduleSize + gliderOffTrue,
                    top: modulePositions[4][1] * moduleSize + gliderOffTrue,
                    child: module,
                  ),
                ],
              ),
            );
          },
        ),
        IconButton(
          iconSize: 40,
          icon: Icon(
            _controller.isAnimating
                ? Icons.pause_circle_outline
                : Icons.play_circle_outline,
            color: golColor,
          ),
          onPressed: () {
            if (_controller.isAnimating) {
              setState(() {
                _controller.stop();
              });
            } else {
              setState(() {
                _controller.forward();
              });
            }
          },
        ),
      ],
    );
  }
}
