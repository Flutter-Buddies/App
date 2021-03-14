import 'dart:async';
import 'dart:math';

import '../robots_models.dart';

part 'robots_state.dart';

class RobotsBloc {
  static const ROBOT_HEIGHT = 80.0;
  static const LASER_FIRE_RATE = 10000;
  static const MAX_ROBOT_VELOCITY = 10.0;
  StreamController<RobotsState> _stateStream;
  Stream<RobotsState> get stateStream => _stateStream.stream;

  RobotsState _state;
  RobotsState get state => _state;

  void initialize() {
    _state = RobotsState();
    emit(state);
  }

  RobotsBloc() {
    _stateStream = StreamController<RobotsState>.broadcast();
    initialize();
  }

  void emit(RobotsState state) {
    _state = state;
    _stateStream.sink.add(_state);
  }

  void computeTimestep() {
    bool gameOver = state.gameOver;

    // move missiles
    List<Missile> missiles =
        state.missiles.map((m) => Missile(m.x, y: m.y + 10)).toList();
    missiles = missiles.where((element) => element.y < state.screenY).toList();

    List<Missile> monsterMissiles =
        state.monsterMissiles.map((m) => Missile(m.x, y: m.y - 10)).toList();
    monsterMissiles =
        monsterMissiles.where((element) => element.y > 0).toList();

    //fire missiles
    int now = DateTime.now().millisecondsSinceEpoch;
    int lastTimeFired = state.lastTimeFired;
    if (now - state.lastTimeFired > state.robotFireRate &&
        !(state.robotDestroyed || state.gameOver)) {
      for (int i = 0; i < state.robotCannons; i++) {
        missiles.add(Missile(
            state.robotPosition + ((i - ((state.robotCannons - 1) * .5)) * 10),
            y: ROBOT_HEIGHT));
      }
      lastTimeFired = now;
    }
    // move robot
    double position = state.robotPosition + state.robotVelocity;
    position = _validPosition(position);

    // move monsters
    double monsterV = state.monsterVelocity;
    double monsterYinc = 0;
    int monstersDefeated = state.monstersDefeated;
    if (state.monsters.any((element) => element.x > state.screenX) ||
        state.monsters.any((element) => element.x < 0)) {
      monsterV *= -1;
      monsterYinc = 10;
    }
    List<Monster> monsters = state.monsters
        .map(
          (e) => Monster(
            e.x + monsterV,
            e.y - monsterYinc,
            size: e.size,
            health: e.health,
            maxHealth: e.maxHealth,
          ),
        )
        .toList();
    if (monsters.any((element) => element.y < 0)) gameOver = true;
    monsters = monsters.where((element) => element.y > 0).toList();

    // Check for monster-missile collisions
    List<Missile> userMissilesToRemove = [];
    List<Monster> monstersToRemove = [];
    for (var monster in monsters) {
      for (var missile in missiles) {
        if ((missile.x - monster.x).abs() < monster.size) {
          if ((missile.y - monster.y).abs() < monster.size) {
            // collision
            userMissilesToRemove.add(missile);
            monster.health -= 1;
            if (monster.health <= 0) {
              monstersToRemove.add(monster);
              monstersDefeated++;
            }
          }
        }
      }
    }

    // check for robot-missile collisions
    List<Missile> monsterMissilesToRemove = [];
    double robotHealth = state.robotHealth;
    bool robotDestroyed = state.robotDestroyed;
    for (var missile in monsterMissiles) {
      if (missile.y < ROBOT_HEIGHT + 10 && missile.y > ROBOT_HEIGHT - 20) {
        if ((missile.x - position).abs() < 15) {
          robotHealth--;
          monsterMissilesToRemove.add(missile);
          if (robotHealth <= 0) robotDestroyed = true;
        }
      }
    }

    // process laser
    Laser laser = state.laser;
    if (state.laser.active) {
      laser = laser.copyWith(xPos: position);
      if (now - state.laser.timeFired > Laser.LASER_DURATION) {
        laser = laser.copyWith(active: false);
      }

      for (var monster in monsters) {
        if ((monster.x - laser.xPos).abs() < 10) {
          monstersToRemove.add(monster);
          monstersDefeated++;
        }
      }
    }

    //remove missiles + monsters
    for(var missile in monsterMissilesToRemove){
      monsterMissiles.remove(missile);
    }
    for(var missile in userMissilesToRemove){
      missiles.remove(missile);
    }
    for(var monster in monstersToRemove){
      monsters.remove(monster);
    }
    

    // check level
    int level = state.level;
    bool upgradeAvailable = state.upgradeAvailable;
    if ((monstersDefeated - (3 * (state.level - 1))) / (3 * state.level) > 1) {
      level++;
      // robotHealth += 2;
      upgradeAvailable = true;
    }

    emit(
      state.copyWith(
        level: level,
        gameOver: gameOver,
        robotDestroyed: robotDestroyed,
        robotHealth: robotHealth,
        missiles: missiles,
        monsterMissiles: monsterMissiles,
        robotPosition: position,
        monsters: monsters,
        monsterVelocity: monsterV,
        monstersDefeated: monstersDefeated,
        lastTimeFired: lastTimeFired,
        laser: laser,
        upgradeAvailable: upgradeAvailable,
      ),
    );
  }

  void moveRobot(double dist) {
    double pos = state.robotPosition + dist;
    pos = _validPosition(pos);
    emit(state.copyWith(robotPosition: pos));
  }

  double _validPosition(double pos) {
    double toReturn = pos;
    if (pos < 0) toReturn += state.screenX;
    if (pos > state.screenX) toReturn -= state.screenX;
    return toReturn;
  }

  void incRobotVelocity(double inc) {
    double velocity = state.robotVelocity + inc;
    if (velocity < -1 * MAX_ROBOT_VELOCITY)
      velocity = -1.0 * MAX_ROBOT_VELOCITY;
    if (velocity > MAX_ROBOT_VELOCITY) velocity = MAX_ROBOT_VELOCITY;
    if (!(state.gameOver || state.robotDestroyed)) {
      emit(state.copyWith(robotVelocity: velocity));
    }
  }

  void resizeScreen(double x, double y) =>
      emit(state.copyWith(screenX: x, screenY: y));

  void fireMissile() => !(state.gameOver || state.robotDestroyed)
      ? emit(
          state.copyWith(
            missiles: [
              ...state.missiles,
              Missile(state.robotPosition, y: ROBOT_HEIGHT),
            ],
          ),
        )
      : null;

  void fireMonsterMissile() {
    if (state.monsters.length > 0) {
      Monster randomMonster =
          state.monsters[Random().nextInt(state.monsters.length)];
      double x = randomMonster.x;
      double y = randomMonster.y;
      emit(state.copyWith(
          monsterMissiles: [...state.monsterMissiles, Missile(x, y: y)]));
    }
  }

  void fireLaser() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - state.laser.timeFired > LASER_FIRE_RATE &&
        !(state.gameOver || state.robotDestroyed)) {
      // fire laser
      Laser laser = Laser(
        timeFired: now,
        xPos: state.robotPosition,
        active: true,
      );
      emit(state.copyWith(laser: laser));
    }
  }

  void testMonster() => emit(
        state.copyWith(
          monsters: [
            ...state.monsters,
            Monster(
              state.monsterVelocity > 0
                  ? state.screenX * .1
                  : state.screenX * .9,
              state.screenY - 120,
              health: 1.0 + 2 * (state.level),
              maxHealth: 1.0 + 2 * (state.level),
            ),
          ],
        ),
      );

  void pickUpgrade(Upgrade upgrade) {
    int robotFireRate = state.robotFireRate;
    double health = state.robotHealth;
    int cannons = state.robotCannons;
    switch (upgrade) {
      case Upgrade.fireRate:
        robotFireRate = robotFireRate ~/ 1.25;
        break;
      case Upgrade.health:
        health += 5;
        break;
      case Upgrade.cannons:
        cannons++;
        break;
      case Upgrade.shield:
        // TODO: Handle this case.
        break;
    }
    emit(state.copyWith(
      robotCannons: cannons,
      robotFireRate: robotFireRate,
      robotHealth: health,
      upgradeAvailable: false,
    ));
  }

  void dispose() {
    _stateStream.close();
  }
}
