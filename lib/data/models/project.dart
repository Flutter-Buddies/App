import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Project {
  final String title;
  final String description;
  final ImageProvider image;
  final String tag;

  // TODO we'll see how attributes are called in GitHub API
  Project.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        image = NetworkImage(json['imageUrl']),
        tag = json['tag'];

  static Project get fake {
    final Faker faker = Faker();
    return Project.fromJson({
      'title': faker.lorem
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
      'tag': [
        'Ongoing',
        'Done',
      ][faker.randomGenerator.integer(1)],
    });
  }
}
