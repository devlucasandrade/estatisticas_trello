import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BarraPage extends StatelessWidget {
  const BarraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int impressa = 4;
    int digital = 1;
    int televisao = 2;
    int radio = 0;

    double total = impressa.toDouble() +
        digital.toDouble() +
        televisao.toDouble() +
        radio.toDouble();

    double impressaPercent = impressa / total;
    double digitalPercent = digital / total;
    double televisaoPercent = televisao / total;
    double radioPercent = radio / total;

    double width = 100;
    double lineHeight = 10;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LinearPercentIndicator(
                  lineHeight: lineHeight,
                  barRadius: const Radius.circular(10),
                  percent: impressaPercent,
                  width: width,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.blue.shade100,
                  leading: const Icon(Icons.newspaper),
                  trailing:
                      Text('${(impressaPercent * 100).toStringAsFixed(1)}%'),
                ),
                const SizedBox(height: 5),
                LinearPercentIndicator(
                  lineHeight: lineHeight,
                  barRadius: const Radius.circular(10),
                  percent: digitalPercent,
                  width: width,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.blue.shade100,
                  leading: const Icon(Icons.computer),
                  trailing:
                      Text('${(digitalPercent * 100).toStringAsFixed(1)}%'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LinearPercentIndicator(
                  lineHeight: lineHeight,
                  barRadius: const Radius.circular(10),
                  percent: televisaoPercent,
                  width: width,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.blue.shade100,
                  leading: const Icon(Icons.tv),
                  trailing:
                      Text('${(televisaoPercent * 100).toStringAsFixed(1)}%'),
                ),
                const SizedBox(height: 5),
                LinearPercentIndicator(
                  lineHeight: lineHeight,
                  barRadius: const Radius.circular(10),
                  percent: radioPercent,
                  width: width,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.blue.shade100,
                  leading: const Icon(Icons.radio),
                  trailing: Text('${(radioPercent * 100).toStringAsFixed(1)}%'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
