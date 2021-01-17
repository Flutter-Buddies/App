import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_buddies/widgets/user_widgets/goober0329/qr_game_of_life/game_of_life_model.dart';

class GoLController extends ChangeNotifier {
  Duration timeStep;
  Timer _timer;
  bool _active = false;

  GoLController({@required this.timeStep});

  bool get isActive => _active;

  void start(GameOfLife gol, Function callBack) {
    _timer = Timer.periodic(timeStep, (timer) => _nextStep(gol, callBack));
    _active = true;
  }

  void stop() {
    if (_timer != null) {
      _timer.cancel();
    }
    _active = false;
  }

  void _nextStep(GameOfLife gol, Function callBack) {
    gol.step();
    callBack();
  }

  void setSpeed(Duration newTimeStep) {
    timeStep = newTimeStep;
  }
}
