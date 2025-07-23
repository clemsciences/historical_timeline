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

  final String? filterString1;
  final String? filterString2;
  final String? filterString3;

  final bool? filterBool1;
  final bool? filterBool2;
  final bool? filterBool3;

  HistoricalTimeline({
    super.key,
    required this.events,
    required this.direction,
    required this.startMargin,
    required this.endMargin,
    required this.size,
    required this.timelineAppearance,
    this.filterString1,
    this.filterString2,
    this.filterString3,
    this.filterBool1,
    this.filterBool2,
    this.filterBool3,
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
      TimelineAppearance.cards => TimelineCards(items: events, filterBool1: filterBool1, filterBool2: filterBool2, filterBool3: filterBool3, filterString1: filterString1, filterString2: filterString2, filterString3: filterString3)
      };
  }
}
