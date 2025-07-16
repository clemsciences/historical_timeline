import 'package:flutter/material.dart';
import 'package:historical_timeline/models/timeline_item.dart';

class TimelineCards extends StatelessWidget {
  final List<TimelineItem> items;

  TimelineCards({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items.map((item) => TimelineCard(event: item)).toList(),
    );
  }
}

class TimelineCard extends StatelessWidget {
  final TimelineItem event;

  const TimelineCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 400,
      child: Card(
        child: ListTile(
          title: Text.rich(
            TextSpan(
              text: "${event.timestamp.year}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: SelectableText.rich(
            TextSpan(text: event.text, style: TextStyle(fontSize: 16)),
          ),

        ),
      ),
    );
  }
}
