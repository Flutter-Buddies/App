import 'dart:math';

import 'package:flutter_buddies/widgets/user_widgets/robots/bloc/robots_bloc.dart';

class MonsterController {
  int minMonsterSpawnTime = 8000;
  int minMonsterFireTime = 1000;
  double monsterSpawnChance = .05;
  double monsterFireChance = .2;

  int lastMonsterSpawnTime = 0;
  int lastMonsterFireTime = 0;

  final RobotsBloc bloc;
  final Random random = Random();

  MonsterController(this.bloc);

  void tick() {
    int now = DateTime.now().millisecondsSinceEpoch;
    double rand1 = random.nextDouble();
    double rand2 = random.nextDouble();

    if (rand1 < monsterSpawnChance + (bloc.state.level * .01) &&
        now - lastMonsterSpawnTime > minMonsterSpawnTime - (500 * bloc.state.level)) {
      bloc.testMonster();
      lastMonsterSpawnTime = now;
    }
    if (rand2 < monsterFireChance + (bloc.state.level * .04) &&
        now - lastMonsterFireTime > minMonsterFireTime - (100 * bloc.state.level)) {
      lastMonsterFireTime = now;
      bloc.fireMonsterMissile();
    }
  }
}
