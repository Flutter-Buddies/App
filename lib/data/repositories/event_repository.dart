import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_buddies/data/models/event.dart';

class EventRepository {
  List<Event> _events = [];

  static EventRepository get() => FakeEventRepository();

  // TODO
  Future<List<Event>> fetchAll({bool fresh: false}) async {
    if (_events.isEmpty || fresh) {
      // fetch events from calendar API
      // final response = await CalendarApi.getEvents();
      // or just
      // final response = await http.get('calendar-api');
      // if (response.statusCode != 200) {
      //    handle error
      // } else {
      //   decode body if response status is OK
      //   final List<Map<String, dynamic>> eventsJson = json.decode(response.body);
      //   transform to Events
      //   _events = eventsJson.map((json) => Event.fromJson(json)).toList();
      // }
    }
    return _events;
  }

  Future<List<Event>> take([int count = 4]) async {
    await this.fetchAll();
    return _events.take(count).toList();
  }
}

class FakeEventRepository extends EventRepository {
  @override
  Future<List<Event>> fetchAll({bool fresh: false}) async {
    int eventsNumber = 10;
    if (_events.isEmpty || _events.length != eventsNumber || fresh) {
      _events = [];
      while (eventsNumber-- > 0) {
        _events.add(Event.fake);
      }
    }
    await Future.delayed(Duration(milliseconds: 400));
    return _events;
  }
}
