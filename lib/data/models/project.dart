import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

String _makeTag(bool archived, bool disabled) {
  if (archived) {
    return 'Archived';
  }
  if (disabled) {
    return 'Disabled';
  }
  return 'Active';
}

//Todo: clean name
//Todo: allow null description
//Todo: Bring in more details for full list
//Todo: figure out images from repo

class Project {
  final String title;
  final String description;
  final ImageProvider image;
  final String tag;
  final String url;

  Project.fromJson(Map<String, dynamic> json)
      : title = json['name'],
        description = json['description'],
        image = NetworkImage('https://picsum.photos/seed/' +
            faker.lorem.word() +
            '/600'), // TODO
        tag = _makeTag(json['archived'], json['disabled']),
        url = json['html_url'];

  static Project get fake {
    final Faker faker = Faker();
    return Project.fromJson({
      'name': faker.lorem
          .words(
            faker.randomGenerator.integer(4, min: 1),
          )
          .join(' '),
      'description': faker.lorem
          .sentences(
            faker.randomGenerator.integer(3, min: 1),
          )
          .join(' '),
      'imageUrl': 'https://picsum.photos/seed/' + faker.lorem.word() + '/600',
      'archived': false,
      'disabled': false,
    });
  }
}
