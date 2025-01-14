import 'package:cbc/data/models/market.dart';
import 'package:flutter/material.dart';

class MarketListDetail extends StatelessWidget {
  final List<Market> markets;

  const MarketListDetail(
      {super.key, required this.markets});

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
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: markets.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Supermercado ${index + 1}:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  markets[index].name ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        })
      ),
    );
  }
}
