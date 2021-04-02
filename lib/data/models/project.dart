import 'package:faker/faker.dart';

String _makeTag(bool archived, bool disabled) {
  if (archived) {
    return 'Archived';
  }
  if (disabled) {
    return 'Disabled';
  }
  return 'Active';
}

const String SCHEME = 'https';
const String HOST = 'raw.githubusercontent.com';
const String PATH_COMPONENT_BASE = 'Flutter-Buddies';
const String PATH_COMPONENT_FILENAME = 'cover_image.png';

//Todo: Bring in more details for full list
//Todo: figure out images from repo

class Project {
  final String title;
  final String repoName;
  final String description;
  // final Future<ImageProvider> image; // COMMENTED OUT - Only download the image if we actually ever display it.
  final String tag;
  final String url;
  final String defaultBranch;

  Project.fromJson(Map<String, dynamic> json)
      : title = (json['name']).toString().replaceAll('-', ' '),
        repoName = json['name'],
        description = json['description'] ?? 'No description available',
        // image =
        //     _getImage(json['html_url'], json['default_branch'], json['name']),
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

  // Let flutter do the hard work of making sure that the URL structure is valid.
  Uri get imageUri => Uri(
        scheme: SCHEME,
        host: HOST,
        pathSegments: [
          PATH_COMPONENT_BASE,
          repoName,
          defaultBranch,
          PATH_COMPONENT_FILENAME
        ],
      );
}
