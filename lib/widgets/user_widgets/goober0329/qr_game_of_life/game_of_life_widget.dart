import 'package:flutter/material.dart';
import 'package:flutter_buddies/widgets/user_widgets/goober0329/qr_game_of_life/game_of_life_controller.dart';

import 'package:flutter_buddies/widgets/user_widgets/goober0329/qr_game_of_life/game_of_life_model.dart';
import 'package:flutter_buddies/widgets/user_widgets/goober0329/qr_game_of_life/gol_display.dart';
import 'package:flutter_buddies/widgets/user_widgets/user_widgets.dart';

class GoLWidget extends StatefulWidget {
  final double size;
  GoLWidget({@required this.size});

  @override
  _GoLWidgetState createState() => _GoLWidgetState();
}

class _GoLWidgetState extends State<GoLWidget> {
  GameOfLife gol;
  GoLController controller;
  bool playing = false;

  @override
  void initState() {
    super.initState();

    gol = GameOfLife();
    controller = GoLController(timeStep: Duration(milliseconds: 350));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoLDisplay(
          gol: gol,
          cellSize: widget.size / gol.width,
          color: golColor,
          cornerRadiusRatio: golCornerRadiusRatio,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              iconSize: 40,
              icon: Icon(
                playing
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline,
                color: golColor,
              ),
              onPressed: () {
                if (playing) {
                  setState(() {
                    controller.stop();
                    playing = false;
                  });
                } else {
                  setState(() {
                    controller.start(gol, () {
                      setState(() {});
                    });
                    playing = true;
                  });
                }
              },
            ),
            IconButton(
              iconSize: 40,
              icon: Icon(
                Icons.shuffle,
                color: golColor,
              ),
              onPressed: () {
                setState(() {
                  gol.randomize();
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
