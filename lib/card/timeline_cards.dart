import 'package:flutter/material.dart';
import 'package:historical_timeline/models/timeline_item.dart';

class TimelineCards extends StatelessWidget {
  final List<TimelineItem> items;

  final String? filterString1;
  final String? filterString2;
  final String? filterString3;

  final List<String>? filterListString1;
  final List<String>? filterListString2;
  final List<String>? filterListString3;

  final bool? filterBool1;
  final bool? filterBool2;
  final bool? filterBool3;

  TimelineCards({
    required this.items,
    this.filterString1,
    this.filterString2,
    this.filterString3,
    this.filterBool1,
    this.filterBool2,
    this.filterBool3,
    this.filterListString1,
    this.filterListString2,
    this.filterListString3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items
          .where((item) {
            var keep = (filterString1 == null || item.string1 == filterString1) &&
                (filterString2 == null || item.string2 == filterString2) &&
                (filterString3 == null || item.string3 == filterString3) &&
                (filterBool1 == null || item.bool1 == filterBool1) &&
                (filterBool2 == null || item.bool2 == filterBool2) &&
                (filterBool3 == null || item.bool3 == filterBool3) &&
                (filterListString1 == null || filterListString1!.contains(item.string1)) &&
                (filterListString2 == null || filterListString2!.contains(item.string2)) &&
                (filterListString3 == null || filterListString3!.contains(item.string3));
            return keep;
        ;
          })
          .map((item) => TimelineCard(event: item))
          .toList(),
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
