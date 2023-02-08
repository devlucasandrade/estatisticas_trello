import 'package:estatisticas_trello/src/app/views/home/bloc/home_bloc.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/donut_widget.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/text_stats.dart';
import 'package:flutter/material.dart';

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

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DonutWidget(
              percent: impressa,
              center: impressa,
              subtitle: TextStats(text: label?.labelImpressa),
            ),
            DonutWidget(
              percent: digital,
              center: digital,
              subtitle: TextStats(text: label?.labelDigital),
            ),
            DonutWidget(
              percent: televisao,
              center: televisao,
              subtitle: TextStats(text: label?.labelTelevisao),
            ),
            DonutWidget(
              percent: radio,
              center: radio,
              subtitle: TextStats(text: label?.labelRadio),
            ),
          ],
        ),
      ],
    );
  }
}
