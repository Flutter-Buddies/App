import 'package:flutter/material.dart';

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
  final double moduleCornerRadius;
  final Duration duration;
  final Color color;

  GoLGlider({
    @required this.gliderSize,
    this.moduleCornerRadius = 0,
    this.color = Colors.black,
    this.duration = const Duration(milliseconds: 1500),
  }) : assert(moduleCornerRadius <= 1);

  @override
  _GoLGliderState createState() => _GoLGliderState();
}

class _GoLGliderState extends State<GoLGlider>
    with SingleTickerProviderStateMixin {
  List<List<int>> modulePositions;
  Container module;
  double moduleSize;

  double gliderOffInit;
  double gliderOff;

  int curState;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    modulePositions = widget.modulePositions;
    moduleSize = widget.gliderSize / 5;
    module = Container(
      width: moduleSize,
      height: moduleSize,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius:
            BorderRadius.circular(widget.moduleCornerRadius * moduleSize / 2),
      ),
    );

    gliderOffInit = widget.gliderSize / 2 - moduleSize * 3 / 2;
    gliderOff = gliderOffInit;

    curState = 0;

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
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
    int newState = (_controller.value * 4).floor();
    int nextIter = newState == 4 ? 1 : 0;
    if (newState != curState && newState != 0) {
      for (int i = 0; i < modulePositions.length; i++) {
        modulePositions[i][0] +=
            widget.modulePositionStateChange[newState - 1][i][0] - nextIter;
        modulePositions[i][1] +=
            widget.modulePositionStateChange[newState - 1][i][1] - nextIter;
      }
      curState = newState;
    }

    setState(() {
      gliderOff = gliderOffInit - _controller.value * moduleSize;
    });

    if (_controller.isCompleted) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.gliderSize,
      height: widget.gliderSize,
      child: Stack(
        children: [
          Positioned(
            left: modulePositions[0][0] * moduleSize + gliderOff,
            top: modulePositions[0][1] * moduleSize + gliderOff,
            child: module,
          ),
          Positioned(
            left: modulePositions[1][0] * moduleSize + gliderOff,
            top: modulePositions[1][1] * moduleSize + gliderOff,
            child: module,
          ),
          Positioned(
            left: modulePositions[2][0] * moduleSize + gliderOff,
            top: modulePositions[2][1] * moduleSize + gliderOff,
            child: module,
          ),
          Positioned(
            left: modulePositions[3][0] * moduleSize + gliderOff,
            top: modulePositions[3][1] * moduleSize + gliderOff,
            child: module,
          ),
          Positioned(
            left: modulePositions[4][0] * moduleSize + gliderOff,
            top: modulePositions[4][1] * moduleSize + gliderOff,
            child: module,
          ),
        ],
      ),
    );
  }
}
