import 'package:flutter/material.dart';
import 'package:historical_timeline/models/timeline_appearance.dart';
import 'package:historical_timeline/card/timeline_cards.dart';
import 'package:historical_timeline/models/timeline_direction.dart';
import 'package:historical_timeline/models/timeline_item.dart';
import 'package:historical_timeline/paint/timeline_painter.dart';

class HistoricalTimeline extends StatelessWidget {
  final TimelineDirection direction;
  final List<TimelineItem> events;
  final TimelineAppearance timelineAppearance;

  final int startMargin;
  final int endMargin;
  final Size size;

  HistoricalTimeline({
    super.key,
    required this.events,
    required this.direction,
    required this.startMargin,
    required this.endMargin,
    required this.size,
    required this.timelineAppearance
  });

  @override
  Widget build(BuildContext context) {
    return switch(timelineAppearance) {
      TimelineAppearance.drawing => SizedBox(
        height: 400,
        width: 500,
        child: CustomPaint(
        painter:
              TimelinePainter(fromColor: Colors.blue,
                  toColor: Colors.red,
                  events: events,
                  start: startMargin,
                  end: endMargin),
          size: size,
          child: Container()
        ),
      ),
      TimelineAppearance.cards => TimelineCards(items: events,)
      };
  }
}
