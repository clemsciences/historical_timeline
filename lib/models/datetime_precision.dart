class DatetimePrecision {
  
  final bool withYear;
  final bool withMonth;
  final bool withDay;
  final bool withHour;
  final bool withMinute;
  final bool withSecond;

  DatetimePrecision({
    required this.withYear,
    required this.withMonth,
    required this.withDay,
    required this.withHour,
    required this.withMinute,
    required this.withSecond,
  });

  DatetimePrecision.year():
      withYear = true,
  withMonth = false,
  withDay = false,
  withHour = false,
  withMinute = false,
  withSecond = false;


}
