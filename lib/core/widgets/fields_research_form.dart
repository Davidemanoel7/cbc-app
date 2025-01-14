import 'package:cbc/core/constants/global_widgets.dart';
import 'package:flutter/material.dart';

class FieldsResearchForm extends StatefulWidget {
  final TextEditingController brandController;
  final TextEditingController priceController;
  final String item;
  final VoidCallback? onEnd;

  const FieldsResearchForm(
      {super.key,
      required this.item,
      required this.brandController,
      required this.priceController,
      this.onEnd});

  @override
  State<FieldsResearchForm> createState() => _FieldsResearchFormState();
}

class _FieldsResearchFormState extends State<FieldsResearchForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.brandController.value.text.isNotEmpty &&
                  widget.priceController.value.text.isNotEmpty
              ? const Color(0xFFB6FFEA)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: widget.brandController,
                          textAlign: TextAlign.left,
                          decoration: inputDecoration(context, 'Marca'),
                          textInputAction: TextInputAction.done,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onEditingComplete: () {
                            widget.onEnd!();
                            FocusScope.of(context).unfocus();
                            setState(() {});
                          },
                          validator: (value) {
                            return (value == null || value.isEmpty)
                                ? 'Campo vazio'
                                : null;
                          }),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: TextFormField(
                          controller: widget.priceController,
                          textAlign: TextAlign.left,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          textInputAction: TextInputAction.done,
                          decoration: inputDecoration(context, 'Preço', prefix: 'R\$ '),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onEditingComplete: () {
                            widget.onEnd!();
                            FocusScope.of(context).unfocus();
                            setState(() {});
                          },
                          validator: (value) {
                            return (value == null || value.isEmpty)
                                ? 'Campo vazio'
                                : null;
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
