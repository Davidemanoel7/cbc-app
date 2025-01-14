import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResearchCardWidget extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final double? percent;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const ResearchCardWidget(
      {super.key,
      this.onPressed,
      this.backgroundColor,
      required this.title,
      required this.isCompleted,
      this.percent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: backgroundColor ?? Colors.white,
        shadowColor: const Color.fromARGB(0, 134, 134, 134),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Visibility(
                    visible: !isCompleted,
                    child: CircularPercentIndicator(
                      radius: 20,
                      lineWidth: 5.0,
                      percent: percent ?? 1,
                      progressColor: const Color(0xFF56C427),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title),
                        Text(isCompleted ? 'Finalizada' : 'Em andamento')
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                  visible: isCompleted,
                  child: Image.asset('lib/assets/images/icone.png'))
            ],
          ),
        ),
      ),
    );
  }
}
