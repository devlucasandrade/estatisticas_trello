import 'package:estatisticas_trello/src/app/core/constants/string_constants.dart';
import 'package:estatisticas_trello/src/components/text/text_styles.dart';
import 'package:flutter/material.dart';

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
