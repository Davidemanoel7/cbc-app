import 'package:flutter/material.dart';

class HeaderResearchForm extends StatelessWidget {

  final String month;
  final String market;

  const HeaderResearchForm({super.key, required this.month, required this.market});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            top: BorderSide(color: Colors.amber, width: 4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mês de referência:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                month,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Supermercado:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(
                market,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
