import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String _makeTag(bool archived, bool disabled) {
  if (archived) {
    return 'Archived';
  }
  if (disabled) {
    return 'Disabled';
  }
  return 'Active';
}

// Todo: Move this _getImage function to the FutureBuilder in the project_card file
Future<NetworkImage> _getImage(
    String url, String defaultBranch, String repoName) async {
  String imageUrl = 'https://raw.githubusercontent.com' +
      '/Flutter-Buddies' +
      '/$repoName/' +
      defaultBranch +
      '/cover_image.png';
  // print(imageUrl);

  http.Response response = await http.get(imageUrl);

  if (response.statusCode == 200) {
    return NetworkImage(imageUrl);
  } else {
    // print(response.statusCode);
    return NetworkImage(
        'https://picsum.photos/seed/' + faker.lorem.word() + '/600');
  }
}

//Todo: Bring in more details for full list
//Todo: figure out images from repo

class Project {
  final String title;
  final String description;
  final Future<ImageProvider> image;
  final String tag;
  final String url;
  final String defaultBranch;

  Project.fromJson(Map<String, dynamic> json)
      : title = (json['name']).toString().replaceAll('-', ' '),
        description = json['description'] ?? 'No description available',
        image =
            _getImage(json['html_url'], json['default_branch'], json['name']),
        tag = _makeTag(json['archived'], json['disabled']),
        url = json['html_url'],
        defaultBranch = json['default_branch'];

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
      'defaultBranch': 'master',
    });
  }
}
