import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:historical_timeline/models/timeline_item.dart';

class TimelinePainter extends CustomPainter {
  final Color fromColor;
  final Color toColor;
  final List<TimelineItem> events;
  final int start;
  final int end;

  TimelinePainter({
    super.repaint,
    required this.fromColor,
    required this.toColor,
    required this.events,
    required this.start,
    required this.end,
  });



  @override
  void paint(Canvas canvas, Size size) {
    var centerLeft = size.centerLeft(Offset.zero);
    var centerRight = size.centerRight(Offset.zero);

    Offset topLeftRect = Offset(0, size.height / 3);
    Offset bottomLeftRect = Offset(0, size.height / 3 * 2);
    Paint centerLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3;
    print(events);

    Paint rectPaint = Paint()
      ..shader = ui.Gradient.linear(centerLeft, centerRight, [
        fromColor,
        toColor,
      ]);

    canvas.drawRect(
      Rect.fromLTWH(
        topLeftRect.dx,
        topLeftRect.dy,
        size.width,
        size.height / 3,
      ),
      rectPaint,
    );

    canvas.drawLine(centerLeft, centerRight, centerLinePaint);
    for (var verticalLine in _makeCoordinates(events)) {

      var topLine = Offset(start+verticalLine, centerLeft.dy-20);
      var bottomLine = Offset(start+verticalLine, centerLeft.dy+20);
      print("$topLine, $bottomLine, $size");
      canvas.drawLine(
        topLine,
        bottomLine,
        centerLinePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }


  List<double> _makeCoordinates(List<TimelineItem> events) {
    List<double> coordinates = [];
    final scale = 300;
    if(events.isNotEmpty) {
      var mini = events.first;
      var maxi = events.last;
      var spread = maxi.timestamp.year - mini.timestamp.year;
      coordinates.add(0);
      for (var event in events) {
        coordinates.add((event.timestamp.year - mini.timestamp.year).toDouble()*scale/(spread.toDouble()));
      }
    }

    return coordinates;
  }
}
