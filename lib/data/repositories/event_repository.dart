import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_buddies/data/models/event.dart';

class EventRepository {
  List<Event> _events = [];

  static EventRepository get() => EventRepository();

  // TODO
  Future<List<Event>> fetchAll({bool fresh: false}) async {
    if (_events.isEmpty || fresh) {
      // fetch events from calendar API
      final response = await http.get(
          'https://www.googleapis.com/calendar/v3/calendars/gh1n5rutlqgsjpvqrba97e9atk@group.calendar.google.com/events?key=' +
              DotEnv().env['CALENDAR_KEY']);
      if (response.statusCode != 200) {
        // handle error
        print('ERROR ${response.statusCode}: ${response.reasonPhrase}');
      } else {
        // decode body if response status is OK
        final Map<String, dynamic> eventsJson = json.decode(response.body);
        final List<dynamic> eventItems = eventsJson['items'];
        // transform to Events
        _events = eventItems.map((json) => Event.fromJson(json)).toList();
      }
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
