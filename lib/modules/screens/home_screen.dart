import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_buddies/widgets/user_widgets/user_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Function to get number of people online using Discord's public API
  Future<int> getDiscordOnlineNumber() async {
    http.Response response = await http
        .get('https://discord.com/api/guilds/768528774991446088/widget.json');
    Map<String, dynamic> decoded = jsonDecode(response.body);
    dynamic numberOnline = decoded['presence_count'];
    return numberOnline;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todo: have bottom part of app bar slide up when scrolling
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(
          image: AssetImage('assets/global_images/flutterbuddies.png'),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Flutter Buddies',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            Text(
              'A Flutter Developer Community',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
            ),
          ],
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
                  iconFunction: () {
                    // Todo: Add twitter link
                  },
                ),
                AppBarIcon(
                  iconImage: AssetImage(
                      'assets/global_images/YouTube-Logo-Shadowed.png'),
                  iconText: 'YouTube',
                  iconColor: Color(0xffFF0000),
                  iconFunction: () {
                    // Todo: Add YouTube link
                  },
                ),
                AppBarIcon(
                  iconImage: AssetImage(
                      'assets/global_images/Website-Logo-Shadowed.png'),
                  iconText: 'Website',
                  iconColor: Color(0xff2771BB),
                  iconFunction: () async {
                    await launch('http://flutterbuddies.com');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionHeader(
              leadingIcon: Icons.calendar_today,
              headerText: 'Upcoming Events',
              headerFunction: () {
                print('Upcoming Events Pressed');
              },
              trailingWidget: Text(
                'See more',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            GridView.count(
              // Shrink wrap tells the grid view to let the children define the size
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              // Setting to none so that the shadow isn't clipped
              clipBehavior: Clip.none,
              childAspectRatio: 0.85,
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              children: [
                EventCard(
                  eventName: 'Flutter talks: State management solutions',
                  eventDateTime: DateTime.now(),
                  eventImage:
                      AssetImage('assets/global_images/flutter-logo.png'),
                ),
                EventCard(
                  eventName: 'Flutter talks: State management solutions',
                  eventDateTime: DateTime.now(),
                  eventImage:
                      AssetImage('assets/global_images/flutter-logo.png'),
                ),
                EventCard(
                  eventName: 'Flutter talks: State management solutions',
                  eventDateTime: DateTime.now(),
                  eventImage:
                      AssetImage('assets/global_images/flutter-logo.png'),
                ),
                EventCard(
                  eventName: 'Flutter talks: State management solutions',
                  eventDateTime: DateTime.now(),
                  eventImage:
                      AssetImage('assets/global_images/flutter-logo.png'),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            SectionHeader(
              leadingIcon: Icons.people,
              headerText: 'Member pages',
              headerFunction: () {
                Navigator.pushNamed(context, 'user_widgets_screen');
              },
              trailingWidget: Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  FutureBuilder<int>(
                    future: getDiscordOnlineNumber(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text('${snapshot.data} members online');
                      } else {
                        return Text('Loading...');
                      }
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MemberCircle(
                  memberName: 'Developer 1',
                  memberImage:
                      AssetImage('assets/global_images/flutter-logo.png'),
                ),
                MemberCircle(
                  memberName: 'Developer 2',
                  memberImage:
                      AssetImage('assets/global_images/flutter-logo.png'),
                ),
                MemberCircle(
                  memberName: 'Developer 3',
                  memberImage:
                      AssetImage('assets/global_images/flutter-logo.png'),
                ),
                MemberCircle(
                  memberName: 'Developer 4',
                  memberImage:
                      AssetImage('assets/global_images/flutter-logo.png'),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            SectionHeader(
              leadingIcon: FontAwesomeIcons.hammer,
              headerText: 'Active Projects',
              headerFunction: () {
                print('Active Projects Pressed');
              },
              trailingWidget: Text(
                'See more',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            ProjectCard(
              projectTitle: 'Tic-Tac-No',
              projectDescription:
                  'An app that is like tac tac tow but with an added twist. Looking for new developers to contribute.',
              projectImage: AssetImage('assets/global_images/flutter-logo.png'),
              projectTag: 'Ongoing',
            ),
            ProjectCard(
              projectTitle: 'Tic-Tac-No',
              projectDescription:
                  'An app that is like tac tac tow but with an added twist. Looking for new developers to contribute.',
              projectImage: AssetImage('assets/global_images/flutter-logo.png'),
              projectTag: 'Ongoing',
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String projectTitle;
  final String projectDescription;
  final ImageProvider projectImage;
  final String projectTag;
  ProjectCard(
      {this.projectTitle,
      this.projectDescription,
      this.projectImage,
      this.projectTag});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: projectImage,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0xff065A9D),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      projectTag,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.white,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projectTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    projectDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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

class MemberCircle extends StatelessWidget {
  final String memberName;
  final ImageProvider memberImage;
  MemberCircle({this.memberName, this.memberImage});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 75,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: memberImage,
                  ),
                  shape: BoxShape.circle),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              memberName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final ImageProvider eventImage;
  final DateTime eventDateTime;
  final String eventName;
  EventCard({this.eventImage, this.eventDateTime, this.eventName});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Image at the bottom
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: eventImage,
              ),
            ),
          ),
          // Gradient over the image to make the text clear
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.75), Colors.transparent]),
            ),
          ),
          // Text over the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // I've decided to have the date resize based on the width because the date should always be visible
                FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    DateFormat('MMMEd').format(eventDateTime) +
                        ' ' +
                        DateFormat.Hm().format(eventDateTime) +
                        ' UTC',
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                // For the name of the event, it will be much more variabel in length so I'm happy to have an overflow and keep the text size constant
                Text(
                  eventName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final IconData leadingIcon;
  final String headerText;
  final Widget trailingWidget;
  final Function headerFunction;
  SectionHeader(
      {this.leadingIcon,
      this.headerText,
      this.trailingWidget,
      this.headerFunction});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: headerFunction,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Icon(leadingIcon),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    headerText + '  >',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            trailingWidget,
          ],
        ),
      ),
    );
  }
}

class AppBarIcon extends StatelessWidget {
  final String iconText;
  final Function iconFunction;
  final Color iconColor;
  final ImageProvider iconImage;
  AppBarIcon(
      {this.iconText, this.iconFunction, this.iconColor, this.iconImage});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: iconFunction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: iconImage,
            height: 42,
          ),
          Text(iconText),
        ],
      ),
    );
  }
}
