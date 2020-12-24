import 'package:flutter/material.dart';
import 'package:flutter_buddies/constants/app_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter Buddies'),
        backgroundColor: kDarkBlue,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:
                          AssetImage('assets/global_images/flutterbuddies.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("""
Flutter Buddies is a discord community for Flutter developers using regular online meetups to help and motivate others with their flutter journey and in return receive help and motivation on yours.

Think of it like a study group on steroids for flutter devs. The core of our community is based on the regular small group meetups and getting to know and help other Flutter devs, no matter your background. We have set weekly timed meetups to get together on discord voice chat and discuss our projects, problems we're facing, suggestions, and more. The channel acts as a way to interact between meetups.
                """),
              ),
              LinkCard(
                cardColor: kBlue,
                cardTitle: 'Join the Discord',
                cardIcon: FontAwesomeIcons.discord,
                cardFunction: () async {
                  await launch('http://FlutterBuddies.com');
                },
              ),
              LinkCard(
                cardColor: Color(0xffADD2E2),
                cardTitle: 'View members',
                cardIcon: Icons.group,
                cardFunction: () {
                  Navigator.pushNamed(context, 'user_widgets_screen');
                },
              ),
              LinkCard(
                cardColor: kLightBlue,
                cardTitle: 'Community Projects',
                cardIcon: Icons.construction,
                cardFunction: () {
                  // Todo: add community projects screen
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.twitter),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.youtube),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinkCard extends StatelessWidget {
  final Color cardColor;
  final String cardTitle;
  final IconData cardIcon;
  final Function cardFunction;
  LinkCard({this.cardColor, this.cardTitle, this.cardIcon, this.cardFunction});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: cardFunction,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        color: cardColor,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    cardIcon,
                    size: 60,
                    color: kVeryDarkBlue,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Column(
                  children: [
                    Text(
                      cardTitle,
                      style: TextStyle(
                          color: kVeryDarkBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              size: 60,
              color: kVeryDarkBlue,
            ),
          ],
        ),
      ),
    );
  }
}
