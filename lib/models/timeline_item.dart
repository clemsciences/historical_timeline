import 'package:historical_timeline/models/datetime_precision.dart';

class TimelineItem {
  final DateTime timestamp;
  final DatetimePrecision precision;
  final String text;
  final String label;
  final Duration? duration;
  final bool? bool1;
  final bool? bool2;
  final bool? bool3;
  final String? string1;
  final String? string2;
  final String? string3;

  TimelineItem({
    required this.timestamp,
    required this.precision,
    required this.text,
    required this.label,
    this.duration,
    this.bool1,
    this.bool2,
    this.bool3,
    this.string1,
    this.string2,
    this.string3,
  });
}
