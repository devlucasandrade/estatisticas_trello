import 'package:estatisticas_trello/src/app/core/constants/string_constants.dart';
import 'package:flutter/material.dart';

class MesBtn extends StatelessWidget {
  const MesBtn({
    Key? key,
    required this.mes,
  }) : super(key: key);

  final String? mes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mes ?? StringConstants.empty,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
