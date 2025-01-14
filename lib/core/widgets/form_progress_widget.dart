
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FormProgressWidget extends StatelessWidget {

  final double percent;

  const FormProgressWidget({super.key, required this.percent });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Progresso da pesquisa', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),),
        Padding(
          padding: const EdgeInsets.all(16),
          child: LinearPercentIndicator(barRadius: const Radius.circular(18), percent: percent, progressColor: const Color(0xFF56C427)),
        )
      ],
    );
  }
}