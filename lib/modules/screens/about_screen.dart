import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white10,
              leading: Image(
                image: AssetImage('assets/global_images/flutterbuddies.png'),
              ),
              centerTitle: true,
              title: Text(
                'About',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('''
Flutter Buddies is a Discord community for Flutter developers using regular online meetups to help and motivate others with their flutter journey and in return receive help and motivation on yours.

Think of it like a study group on steroids for flutter devs. The core of our community is based on the regular small group meetups and getting to know and help other Flutter devs, no matter your background. We have set weekly timed meetups to get together on discord voice chat and discuss our projects, problems we're facing, suggestions, and more. The channel acts as a way to interact between meetups.

This concept works best if we get to know each other a little, give some commitment to the group, be present, and be willing to give back to the group when you can.

Interactivity is key to your success here! Being a part of the active group will help you find a core group of people to help you and for you to grow with as a Flutter dev.
'''),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text('Find out more on '),
                        Text(
                          'GitHub',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue),
                        ),
                        Text('.'),
                      ],
                    ),
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
