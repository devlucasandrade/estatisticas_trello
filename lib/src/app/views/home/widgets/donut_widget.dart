import 'package:estatisticas_trello/src/app/views/home/widgets/text_stats.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DonutWidget extends StatelessWidget {
  const DonutWidget({
    Key? key,
    required this.percent,
    required this.center,
    required this.subtitle,
  }) : super(key: key);

  final double percent;
  final double center;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
          child: CircularPercentIndicator(
            animation: true,
            radius: 35,
            lineWidth: 10,
            percent: percent,
            progressColor: Colors.blue,
            backgroundColor: Colors.blue.shade100,
            center: TextStats(text: '${(center * 100).toStringAsFixed(1)}%'),
          ),
        ),
        const SizedBox(height: 5),
        subtitle,
      ],
    );
  }
}
