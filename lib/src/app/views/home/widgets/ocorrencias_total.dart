import 'package:estatisticas_trello/src/app/views/home/bloc/home_bloc.dart';
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
                      const Text('Impressa:'),
                      Text('${widget.label?.impressa}'),
                      const SizedBox(width: 10),
                      const Text('Digital:'),
                      Text('${widget.label?.digital}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Televisão:'),
                      Text('${widget.label?.televisao}'),
                      const SizedBox(width: 10),
                      const Text('Rádio:'),
                      Text('${widget.label?.radio}'),
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
                            const Text('Resposta:'),
                            Text('${widget.label?.respostaImprenssa}'),
                            const SizedBox(width: 10),
                            const Text('Espontânea:'),
                            Text('${widget.label?.espontanea}'),
                            const SizedBox(width: 10),
                            const Text('Artigo:'),
                            Text('${widget.label?.artigo}'),
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
                            const Text('Positivo:'),
                            Text('${widget.label?.positiva}'),
                            const SizedBox(width: 10),
                            const Text('Neutra:'),
                            Text('${widget.label?.neutra}'),
                            const SizedBox(width: 10),
                            const Text('Negativa:'),
                            Text('${widget.label?.negativa}'),
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
