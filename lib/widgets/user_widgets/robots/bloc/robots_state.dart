part of 'robots_bloc.dart';


class RobotsState {
  final int level;
  final bool gameOver;
  final bool robotDestroyed;
  final double robotPosition;
  final double robotHealth;
  final double robotVelocity;
  final double screenX;
  final double screenY;
  final List<Missile> missiles;
  final List<Monster> monsters;
  final List<Missile> monsterMissiles;
  final double monsterVelocity;
  final int monstersDefeated;
  final int lastTimeFired;
  final int robotFireRate;
  final Laser laser;
  final bool upgradeAvailable;
  final int robotCannons;

  const RobotsState({
    this.level = 1,
    this.gameOver = false,
    this.robotDestroyed = false,
    this.screenX = 0,
    this.screenY = 0,
    this.robotVelocity = 0,
    this.robotHealth = 10,
    this.robotPosition = 0,
    this.missiles = const [],
    this.monsters = const [],
    this.monsterVelocity = 4,
    this.monstersDefeated = 0,
    this.monsterMissiles = const [],
    this.lastTimeFired = 0,
    this.robotFireRate = 1000,
    this.laser = const Laser(),
    this.upgradeAvailable = false,
    this.robotCannons = 1,
  });

  RobotsState copyWith({
    int level,
    bool gameOver,
    bool robotDestroyed,
    double robotPosition,
    double robotVelocity,
    double robotHealth,
    double screenX,
    double screenY,
    List<Missile> missiles,
    List<Monster> monsters,
    double monsterVelocity,
    int monstersDefeated,
    List<Missile> monsterMissiles,
    int lastTimeFired,
    int robotFireRate,
    Laser laser,
    bool upgradeAvailable,
    int robotCannons,
  }) =>
      RobotsState(
        level: level ?? this.level,
        robotDestroyed: robotDestroyed ?? this.robotDestroyed,
        gameOver: gameOver ?? this.gameOver,
        robotPosition: robotPosition ?? this.robotPosition,
        robotVelocity: robotVelocity ?? this.robotVelocity,
        robotHealth: robotHealth ?? this.robotHealth,
        screenX: screenX ?? this.screenX,
        screenY: screenY ?? this.screenY,
        missiles: missiles ?? this.missiles,
        monsters: monsters ?? this.monsters,
        monsterVelocity: monsterVelocity ?? this.monsterVelocity,
        monsterMissiles: monsterMissiles ?? this.monsterMissiles,
        monstersDefeated: monstersDefeated ?? this.monstersDefeated,
        lastTimeFired: lastTimeFired ?? this.lastTimeFired,
        robotFireRate: robotFireRate ?? this.robotFireRate,
        laser: laser ?? this.laser,
        upgradeAvailable: upgradeAvailable ?? this.upgradeAvailable,
        robotCannons: robotCannons ?? this.robotCannons,
      );
}

enum Upgrade { fireRate, health, cannons, shield }
