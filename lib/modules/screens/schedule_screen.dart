import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_buddies/data/models/event.dart';
import 'package:flutter_buddies/data/repositories/event_repository.dart';
import 'package:flutter_buddies/widgets/app_bar_icon.dart';
import 'package:flutter_buddies/widgets/event_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleScreen extends StatelessWidget {
  final EventRepository _eventRepository = EventRepository.get();
  final String pageName = 'Upcoming Events';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white10,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image(
                  image: AssetImage('assets/global_images/flutterbuddies.png'),
                ),
              ),
              centerTitle: true,
              title: Text(
                pageName,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 80),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppBarIcon(
                        iconImage: AssetImage(
                            'assets/global_images/Discord-Logo-Shadowed.png'),
                        iconText: 'Discord',
                        iconColor: Color(0xff8C9EFF),
                        iconFunction: () async {
                          await launch('http://flutterbuddies.com');
                        },
                      ),
                      AppBarIcon(
                        iconImage: AssetImage(
                            'assets/global_images/Twitter-Logo-Shadowed.png'),
                        iconText: 'Twitter',
                        iconColor: Color(0xff00A2F5),
                        iconFunction: () async {
                          await launch('https://twitter.com/Flutter_Buddies');
                        },
                      ),
                      AppBarIcon(
                        iconImage: AssetImage(
                            'assets/global_images/YouTube-Logo-Shadowed.png'),
                        iconText: 'YouTube',
                        iconColor: Color(0xffFF0000),
                        iconFunction: () async {
                          await launch(
                              'https://www.youtube.com/channel/UCxBpCSJUJFj26S-4KwNNR1w');
                        },
                      ),
                      AppBarIcon(
                        iconImage: AssetImage(
                            'assets/global_images/Website-Logo-Shadowed.png'),
                        iconText: 'Website',
                        iconColor: Color(0xff2771BB),
                        iconFunction: () async {
                          await launch(
                              'https://github.com/Flutter-Buddies/README');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  '<   ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Icon(Icons.calendar_today),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Schedule of Events',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FutureBuilder<List<Event>>(
                    future: _eventRepository.take(14),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.count(
                          // Shrink wrap tells the grid view to let the children define the size
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          // Setting to none so that the shadow isn't clipped
                          clipBehavior: Clip.none,
                          childAspectRatio: 1.50,
                          crossAxisCount: 2,
                          physics: NeverScrollableScrollPhysics(),
                          children: snapshot.data
                              .map((event) => EventCard(
                                    eventName: event.name,
                                    eventImage: AssetImage(
                                        'assets/global_images/Event_Image.png'), // Use generic image
                                    eventDateTime: event.dateTime,
                                  ))
                              .toList(),
                        );
                      } else {
                        return SizedBox(
                          height: 240,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
