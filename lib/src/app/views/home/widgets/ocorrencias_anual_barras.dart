import 'package:estatisticas_trello/src/app/core/constants/icons_constants.dart';
import 'package:estatisticas_trello/src/app/core/constants/string_constants.dart';
import 'package:estatisticas_trello/src/app/views/home/bloc/home_bloc.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/bar_widget.dart';
import 'package:flutter/material.dart';

class OcorrenciasAnualBarras extends StatelessWidget {
  const OcorrenciasAnualBarras({
    Key? key,
    this.listId,
  }) : super(key: key);

  final String? listId;

  @override
  Widget build(BuildContext context) {
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
                            BarWidget(
                              percent: impressa,
                              trailing: impressa,
                              leading: IconConstants.newspaper,
                            ),
                            const SizedBox(height: 5),
                            BarWidget(
                              percent: digital,
                              trailing: digital,
                              leading: IconConstants.computer,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            BarWidget(
                              percent: televisao,
                              trailing: televisao,
                              leading: IconConstants.televisao,
                            ),
                            const SizedBox(height: 5),
                            BarWidget(
                              percent: radio,
                              trailing: radio,
                              leading: IconConstants.radio,
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
