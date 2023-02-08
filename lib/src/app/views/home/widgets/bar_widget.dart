import 'package:estatisticas_trello/src/app/views/home/widgets/text_stats.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({
    Key? key,
    required this.percent,
    required this.trailing,
    required this.leading,
  }) : super(key: key);

  final double percent;
  final double trailing;
  final Icon leading;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 10,
      percent: percent,
      width: 100,
      animation: true,
      progressColor: Colors.blue,
      backgroundColor: Colors.blue.shade100,
      leading: leading,
      trailing: TextStats(text: '${(trailing * 100).toStringAsFixed(1)}%'),
    );
  }
}
