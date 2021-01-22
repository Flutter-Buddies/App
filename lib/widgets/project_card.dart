import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String projectTitle;
  final String projectDescription;
  final ImageProvider projectImage;
  final String projectTag;
  final String url;

  ProjectCard({
    this.projectTitle,
    this.projectDescription,
    this.projectImage,
    this.projectTag,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launch(url),
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
