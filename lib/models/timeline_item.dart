import 'package:historical_timeline/models/datetime_precision.dart';

class TimelineItem {
  final DateTime timestamp;
  final DatetimePrecision precision;
  final String text;
  final String label;
  final Duration? duration;

  TimelineItem({
    required this.timestamp,
    required this.precision,
    required this.text,
    required this.label,
    this.duration
  });
}
