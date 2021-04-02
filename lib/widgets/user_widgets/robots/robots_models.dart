import 'package:flutter/material.dart';

class Missile {
  final double x;
  final double y;

  static const List<Color> MISSILE_COLORS = <Color>[
    Colors.orange,
    Colors.yellow,
    Colors.red,
    Colors.yellowAccent,
    Colors.pink,
    Colors.redAccent
  ];

  Missile(
    this.x, {
    this.y = 20,
  });
}

class Monster {
  final double x;
  final double y;
  final double size;
  final double maxHealth;
  double health;

  Monster(
    this.x,
    this.y, {
    this.size = 20,
    this.maxHealth = 3,
    this.health = 3,
  });
}

class Laser {
  static const LASER_DURATION = 2000;

  final int timeFired;
  final double xPos;
  final bool active;

  const Laser({
    this.timeFired = 0,
    this.xPos,
    this.active = false,
  });

  Laser copyWith({
    int timeFired,
    double xPos,
    bool active,
  }) =>
      Laser(
        active: active ?? this.active,
        xPos: xPos ?? this.xPos,
        timeFired: timeFired ?? this.timeFired,
      );
}
