import 'dart:convert';

import 'package:flutter_buddies/constants/secrets.dart';
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
            Secrets.calendar_key,
      );
      if (response.statusCode != 200) {
        // handle error
        print('ERROR ${response.statusCode}: ${response.reasonPhrase}');
      } else {
        // decode body if response status is OK
        final Map<String, dynamic> eventsJson = json.decode(response.body);
        final List<dynamic> eventItems = eventsJson['items'];
        // transform to Events
        eventItems.forEach((itemJson) {
          try {
            // some of the events are 'cancelled' and
            // don't have required attributes for parsing into Event
            _events.add(Event.fromJson(itemJson));
          } catch (e) {}
        });
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
