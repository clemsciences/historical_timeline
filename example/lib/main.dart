import 'package:flutter/material.dart';
import 'package:historical_timeline/historical_timeline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historical timeline demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),

      home: TimelineExample(),
    );
  }
}

class TimelineExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    var size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple.shade100, Colors.blue.shade100],
        ),
      ),
      child: Container(
        margin: padding,
        height: size.height,
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  // height: 0.1 * size.height,
                  child: SelectableText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "L'Histoire de France",
                          style: Theme.of(context).textTheme.displayLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: HistoricalTimeline(
                    timelineAppearance: TimelineAppearance.cards,
                    direction: TimelineDirection.horizontal,
                    size: Size(300, 300),
                    endMargin: 50,
                    startMargin: 50,
                    filterBool1: true,
                    events: [
                      TimelineItem(
                        text: "Défaite d'Alésia.",
                        label: "",
                        precision: DatetimePrecision.year(),
                        timestamp: DateTime(-52, 9),
                        bool1: true,
                      ),
                      TimelineItem(
                        text: "Clovis devient roi des Francs.",
                        label: "",
                        precision: DatetimePrecision.year(),
                        timestamp: DateTime(481),
                        bool1: false,
                      ),
                      TimelineItem(
                        text:
                            "Election de Hugues Capet en roi de Francie occidentale.",
                        label: "",
                        precision: DatetimePrecision.year(),
                        timestamp: DateTime(987, 6, 1),
                        bool1: false,
                      ),
                      TimelineItem(
                        text: "Fin de la Guerre de Cent Ans.",
                        label: "",
                        precision: DatetimePrecision.year(),
                        timestamp: DateTime(1453),
                        bool1: false,
                      ),
                      TimelineItem(
                        timestamp: DateTime(1789),
                        precision: DatetimePrecision.year(),
                        text: "Révolution Française.",
                        label: "",
                        bool1: false,
                      ),
                      TimelineItem(
                        timestamp: DateTime(1958),
                        precision: DatetimePrecision.year(),
                        text: "Ve République.",
                        label: "",
                        bool1: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
