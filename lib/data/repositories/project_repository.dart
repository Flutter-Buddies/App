import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_buddies/data/models/project.dart';

class ProjectRepository {
  List<Project> _projects = [];

  static ProjectRepository get() => ProjectRepository();

  Future<List<Project>> fetchAll({bool fresh: false}) async {
    if (_projects.isEmpty || fresh) {
      // fetch projects from GitHub API
      final response =
          await http.get('https://api.github.com/orgs/Flutter-Buddies/repos');
      if (response.statusCode != 200) {
        // TODO handle error
        print('ERROR ${response.statusCode}: ${response.reasonPhrase}');
      } else {
        // decode body if response status is OK
        final List<dynamic> projectsJson = json.decode(response.body);
        // transform to Projects
        _projects = projectsJson.map((json) => Project.fromJson(json)).toList();
      }
    }
    return _projects;
  }

  Future<List<Project>> take([int count = 3]) async {
    await this.fetchAll();
    return _projects.take(count).toList();
  }
}

class FakeProjectRepository extends ProjectRepository {
  @override
  Future<List<Project>> fetchAll({bool fresh: false}) async {
    int projectsNumber = 10;
    if (_projects.isEmpty || _projects.length != projectsNumber || fresh) {
      _projects = [];
      while (projectsNumber-- > 0) {
        _projects.add(Project.fake);
      }
    }
    await Future.delayed(Duration(milliseconds: 400));
    return _projects;
  }
}
