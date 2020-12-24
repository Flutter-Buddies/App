import 'package:flutter/material.dart';
import 'package:flutter_buddies/constants/app_constants.dart';
import 'package:flutter_buddies/widgets/user_widgets/user_widgets.dart';
//import 'package:flutter_buddies/widgets/user_widgets/widget_info.dart';

//TODO: Test

class UserWidgetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugPrint(widgetInfoList.toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kDarkBlue,
          title: Text('Developer Widgets'),
        ),
        body: ListView.builder(
          itemCount: widgetInfoList.length,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => widgetInfoList[index].widget,
                  ),
                );
              },
              child: DeveloperCard(
                developerName: widgetInfoList[index].developer,
                developerDescription: widgetInfoList[index].description,
              ),
            );
          },
        ),
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final String developerName;
  final String developerDescription;
  DeveloperCard({this.developerName, this.developerDescription});
  @override
  Widget build(BuildContext context) {
    return Container(
      // Sets the overall height of the 'card'
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      // Stacks the 2 painters, and the body text
      // The developer name is part of the top custom painter widget to make alignment easier
      // Stacks render bottom to top
      child: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: SizedBox(
              height: 40,
              // Fill the width of the container
              width: double.infinity,
              child: CustomPaint(
                painter: AngledLine(shapeColor: kDarkBlue, version: 'Side'),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: CustomPaint(
              painter: AngledLine(
                shapeColor: kBlue.withOpacity(0.8),
                version: 'Top',
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    developerName,
                    style: TextStyle(
                        color: kVeryDarkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 45, right: 45),
            child: Text(
              developerDescription,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: kVeryDarkBlue, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class AngledLine extends CustomPainter {
  final Color shapeColor;
  final String version;

  AngledLine({this.shapeColor, this.version});
  @override
  void paint(Canvas canvas, Size size) {
    // Initialise the painter
    final paint = Paint();

    // Set the colour of the painter
    paint.color = shapeColor;

    // Initialise the path
    var path = Path();

    // Draw the outline of the shape
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    // Change the 'angle' depending on what side the shape is drawn
    path.lineTo(size.width - (version == 'Top' ? 45 : 25), 0);
    path.close();

    // Tell the canvas to draw the path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
