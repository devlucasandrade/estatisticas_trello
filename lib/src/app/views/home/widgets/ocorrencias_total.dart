import 'package:estatisticas_trello/src/app/core/constants/string_constants.dart';
import 'package:estatisticas_trello/src/app/views/home/bloc/home_bloc.dart';
import 'package:estatisticas_trello/src/components/text/text_styles.dart';
import 'package:flutter/material.dart';

class OcorrenciasTotal extends StatefulWidget {
  const OcorrenciasTotal({
    Key? key,
    required this.label,
  }) : super(key: key);

  final LabelsInt? label;

  @override
  State<OcorrenciasTotal> createState() => _OcorrenciasTotalState();
}

class _OcorrenciasTotalState extends State<OcorrenciasTotal> {
  @override
  Widget build(BuildContext context) {
    final tipoMidia = widget.label?.respostaImprenssa != 0 ||
        widget.label?.espontanea != 0 ||
        widget.label?.artigo != 0;

    final tipoClassificacao = widget.label?.positiva != 0 ||
        widget.label?.neutra != 0 ||
        widget.label?.negativa != 0;

    return Container(
      height: tipoMidia || tipoClassificacao
          ? MediaQuery.of(context).size.height * 0.35
          : MediaQuery.of(context).size.height * 0.22,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'OCORRÊNCIAS',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextStats(text: widget.label?.labelImpressa),
                      TextStats(text: widget.label?.impressa.toString()),
                      const SizedBox(width: 10),
                      TextStats(text: widget.label?.labelDigital),
                      TextStats(text: widget.label?.digital.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Televisão:',
                        style: TextStyles.stats(),
                      ),
                      Text(
                        '${widget.label?.televisao}',
                        style: TextStyles.stats(),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Rádio:',
                        style: TextStyles.stats(),
                      ),
                      Text(
                        '${widget.label?.radio}',
                        style: TextStyles.stats(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          tipoMidia
              ? Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        'TIPO DE MÍDIA',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Resposta:',
                              style: TextStyles.stats(),
                            ),
                            Text(
                              '${widget.label?.respostaImprenssa}',
                              style: TextStyles.stats(),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Espontânea:',
                              style: TextStyles.stats(),
                            ),
                            Text(
                              '${widget.label?.espontanea}',
                              style: TextStyles.stats(),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Artigo:',
                              style: TextStyles.stats(),
                            ),
                            Text(
                              '${widget.label?.artigo}',
                              style: TextStyles.stats(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
          tipoClassificacao
              ? Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: const Text(
                        'CLASSIFICAÇÃO',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Positivo:',
                              style: TextStyles.stats(),
                            ),
                            Text(
                              '${widget.label?.positiva}',
                              style: TextStyles.stats(),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Neutra:',
                              style: TextStyles.stats(),
                            ),
                            Text(
                              '${widget.label?.neutra}',
                              style: TextStyles.stats(),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Negativa:',
                              style: TextStyles.stats(),
                            ),
                            Text(
                              '${widget.label?.negativa}',
                              style: TextStyles.stats(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class TextStats extends StatelessWidget {
  final String? text;

  const TextStats({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? StringConstants.empty,
      style: TextStyles.stats(),
    );
  }
}
