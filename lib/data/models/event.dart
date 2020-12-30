import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Event {
  final String name;
  final ImageProvider image;
  final DateTime dateTime;

  Event.fromJson(Map<String, dynamic> json)
      : name = json['summary'],
        image = NetworkImage(
            'https://picsum.photos/seed/' + faker.lorem.word() + '/600'),
        dateTime = DateTime.parse(json['start']['dateTime']);

  static Event get fake {
    final Faker faker = Faker();
    return Event.fromJson({
      'summary': faker.lorem
          .words(
            faker.randomGenerator.integer(6, min: 1),
          )
          .join(' '),
      'imageUrl': 'https://picsum.photos/seed/' + faker.lorem.word() + '/600',
      'start': {
        'dateTime':
            faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
      }
    });
  }
}
