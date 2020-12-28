import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Event {
  final String name;
  final ImageProvider image;
  final DateTime dateTime;

  // TODO we'll see how attributes are called in calendar API
  Event.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = NetworkImage(json['imageUrl']),
        dateTime = DateTime.parse(json['dateTime']);

  static Event get fake {
    final Faker faker = Faker();
    return Event.fromJson({
      'name': faker.lorem
          .words(
            faker.randomGenerator.integer(6, min: 1),
          )
          .join(' '),
      'imageUrl': 'https://picsum.photos/seed/' + faker.lorem.word() + '/600',
      'dateTime': faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
    });
  }
}
