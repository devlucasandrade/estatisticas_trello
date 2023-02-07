import 'package:estatisticas_trello/src/app/views/home/bloc/home_bloc.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/text_stats.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OcorrenciasAnualDonuts extends StatelessWidget {
  const OcorrenciasAnualDonuts({
    Key? key,
    required this.label,
  }) : super(key: key);

  final LabelsInt? label;

  @override
  Widget build(BuildContext context) {
    final total = (label?.impressa.toDouble() ?? 0) +
        (label?.digital.toDouble() ?? 0) +
        (label?.televisao.toDouble() ?? 0) +
        (label?.radio.toDouble() ?? 0);
    final impressa = (label?.impressa.toDouble() ?? 0) / total;
    final digital = (label?.digital.toDouble() ?? 0) / total;
    final televisao = (label?.televisao.toDouble() ?? 0) / total;
    final radio = (label?.radio.toDouble() ?? 0) / total;

    double radius = 35;
    double lineWidth = 10;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  child: CircularPercentIndicator(
                    animation: true,
                    radius: radius,
                    lineWidth: lineWidth,
                    percent: impressa,
                    progressColor: Colors.blue,
                    backgroundColor: Colors.blue.shade100,
                    center: TextStats(
                        text: '${(impressa * 100).toStringAsFixed(1)}%'),
                  ),
                ),
                const SizedBox(height: 5),
                TextStats(text: label?.labelImpressa),
              ],
            ),
            Column(
              children: [
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  child: CircularPercentIndicator(
                    animation: true,
                    radius: radius,
                    lineWidth: lineWidth,
                    percent: digital,
                    progressColor: Colors.blue,
                    backgroundColor: Colors.blue.shade100,
                    center: TextStats(
                        text: '${(digital * 100).toStringAsFixed(1)}%'),
                  ),
                ),
                const SizedBox(height: 5),
                TextStats(text: label?.labelDigital),
              ],
            ),
            Column(
              children: [
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  child: CircularPercentIndicator(
                    animation: true,
                    radius: radius,
                    lineWidth: lineWidth,
                    percent: televisao,
                    progressColor: Colors.blue,
                    backgroundColor: Colors.blue.shade100,
                    center: TextStats(
                        text: '${(televisao * 100).toStringAsFixed(1)}%'),
                  ),
                ),
                const SizedBox(height: 5),
                TextStats(text: label?.labelTelevisao),
              ],
            ),
            Column(
              children: [
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  child: CircularPercentIndicator(
                    animation: true,
                    radius: radius,
                    lineWidth: lineWidth,
                    percent: radio,
                    progressColor: Colors.blue,
                    backgroundColor: Colors.blue.shade100,
                    center:
                        TextStats(text: '${(radio * 100).toStringAsFixed(1)}%'),
                  ),
                ),
                const SizedBox(height: 5),
                TextStats(text: label?.labelRadio),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
