import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_buddies/data/models/project.dart';
import 'package:flutter_buddies/data/repositories/project_repository.dart';
import 'package:flutter_buddies/widgets/app_bar_icon.dart';
import 'package:flutter_buddies/widgets/project_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  final ProjectRepository _projectRepository = ProjectRepository.get();
  final String pageName = 'Group Projects';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        //! this should change the notification area text to black but it isn't
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
                                  'Group Projects',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await launch(
                                  'https://github.com/Flutter-Buddies');
                            },
                            child: Text(
                              'View on Github...',
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FutureBuilder<List<Project>>(
                    future: _projectRepository.takeAll(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: snapshot.data
                              .map((project) => Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, bottom: 16),
                                    child: ProjectCard(
                                      projectTitle: project.title,
                                      projectDescription: project.description,
                                      projectImage: project.image,
                                      projectTag: project.tag,
                                      url: project.url,
                                    ),
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
                    height: 8,
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
