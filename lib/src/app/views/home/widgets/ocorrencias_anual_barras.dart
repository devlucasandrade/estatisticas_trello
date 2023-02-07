import 'package:estatisticas_trello/src/app/core/constants/icons_constants.dart';
import 'package:estatisticas_trello/src/app/core/constants/string_constants.dart';
import 'package:estatisticas_trello/src/app/views/home/bloc/home_bloc.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/text_stats.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OcorrenciasAnualBarras extends StatelessWidget {
  const OcorrenciasAnualBarras({
    Key? key,
    this.listId,
  }) : super(key: key);

  final String? listId;

  @override
  Widget build(BuildContext context) {
    double width = 100;
    double lineHeight = 10;
    final homebloc = HomeBloc();

    return FutureBuilder(
      future:
          homebloc.getLabelsOnCardsOnList(listId ?? StringConstants.mesBase),
      builder: (context, snapshot) {
        final labelsOnCards = snapshot.data;
        final existeLabels = (labelsOnCards?.impressa != 0) ||
            (labelsOnCards?.digital != 0) ||
            (labelsOnCards?.televisao != 0) ||
            (labelsOnCards?.radio != 0);

        final total = (labelsOnCards?.impressa.toDouble() ?? 0) +
            (labelsOnCards?.digital.toDouble() ?? 0) +
            (labelsOnCards?.televisao.toDouble() ?? 0) +
            (labelsOnCards?.radio.toDouble() ?? 0);
        final impressa = (labelsOnCards?.impressa ?? 0) / total;
        final digital = (labelsOnCards?.digital ?? 0) / total;
        final televisao = (labelsOnCards?.televisao ?? 0) / total;
        final radio = (labelsOnCards?.radio ?? 0) / total;

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return existeLabels
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            LinearPercentIndicator(
                              lineHeight: lineHeight,
                              percent: impressa,
                              width: width,
                              progressColor: Colors.blue,
                              backgroundColor: Colors.blue.shade100,
                              leading: IconConstants.newspaper,
                              trailing: TextStats(
                                  text:
                                      '${(impressa * 100).toStringAsFixed(1)}%'),
                            ),
                            const SizedBox(height: 5),
                            LinearPercentIndicator(
                              lineHeight: lineHeight,
                              percent: digital,
                              width: width,
                              progressColor: Colors.blue,
                              backgroundColor: Colors.blue.shade100,
                              leading: IconConstants.computer,
                              trailing: TextStats(
                                  text:
                                      '${(digital * 100).toStringAsFixed(1)}%'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            LinearPercentIndicator(
                              lineHeight: lineHeight,
                              percent: televisao,
                              width: width,
                              progressColor: Colors.blue,
                              backgroundColor: Colors.blue.shade100,
                              leading: IconConstants.televisao,
                              trailing: TextStats(
                                  text:
                                      '${(televisao * 100).toStringAsFixed(1)}%'),
                            ),
                            const SizedBox(height: 5),
                            LinearPercentIndicator(
                              lineHeight: lineHeight,
                              percent: radio,
                              width: width,
                              progressColor: Colors.blue,
                              backgroundColor: Colors.blue.shade100,
                              leading: IconConstants.radio,
                              trailing: TextStats(
                                  text: '${(radio * 100).toStringAsFixed(1)}%'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : Container();
        }
      },
    );
  }
}
