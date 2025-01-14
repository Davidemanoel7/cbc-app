import 'package:flutter/material.dart';

class FieldsResearchDetail extends StatelessWidget {
  final String title;
  final String price;

  const FieldsResearchDetail(
      {super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.blueGrey.shade100, borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        price,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: const Color(0xFF535353)),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
