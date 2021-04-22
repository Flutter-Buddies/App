import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_buddies/data/models/project.dart';

class ProjectRepository {
  static final ProjectRepository _projectRepository = ProjectRepository._();
  List<Project> _projects = [];

  static ProjectRepository get() => _projectRepository;

  factory ProjectRepository() {
    return _projectRepository;
  }

  ProjectRepository._();

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

  Future<List<Project>> takeAll() async {
    return await this.fetchAll();
  }
}

class FakeProjectRepository implements ProjectRepository {
  final ProjectRepository _delegate;

  List<Project> get _projects => _delegate._projects;
  set _projects(value) => _delegate._projects = value;

  FakeProjectRepository() : _delegate = ProjectRepository();

  Future<List<Project>> take([int count = 3]) => _delegate.take();
  Future<List<Project>> takeAll() => _delegate.takeAll();

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
