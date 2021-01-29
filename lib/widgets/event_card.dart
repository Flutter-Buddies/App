import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                    DateFormat('MMMEd').format(eventDateTime.toLocal()) +
                        ' ' +
                        DateFormat.Hm().format(eventDateTime.toLocal()) +
                        ' ${DateTime.now().timeZoneName}',
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
