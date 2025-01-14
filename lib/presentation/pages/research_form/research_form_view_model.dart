import 'package:cbc/data/models/market.dart';
import 'package:cbc/data/models/research.dart';
import 'package:cbc/data/models/research_form.dart';
import 'package:cbc/data/services/rest_service.dart';
import 'package:cbc/presentation/pages/research_form/research_form_repository.dart';
import 'package:cbc/providers/provider_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

mixin ResearchFormViewDelegate {
  void success();
  void failure();
}

class ResearchFormViewModel extends ProviderBase {

  final Research? research;
  final Market? selectedMarket;

  final int quantityOfItems = 12;

  List<ResearchForm> controllers = [
    ResearchForm(name: 'Arroz', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Feijão', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Carne', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Leite', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Manteiga', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Farinha', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Tomate', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Banana', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Pão', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Café', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Óleo', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
    ResearchForm(name: 'Açúcar', brandController: TextEditingController(), priceController: MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.', initialValue: 0, rightSymbol: '', leftSymbol: '')),
  ];

  final ResearchFormViewDelegate? view;
  final ResearchFormRepository repository;

  ResearchFormViewModel({this.selectedMarket, this.research, this.view, ResearchFormRepository? repository}) : repository = repository ?? ResearchFormRepository(RestService());

  @override
  void dispose() {
    for (var e in controllers) {
      e.brandController.dispose();
      e.priceController.dispose();
    }
    super.dispose();
  }

  Future<void> save() async {
    
    // var result = await repository.sendResearch();

    // if (result.isSuccess) {
      view?.success();
    // } else {
    //   view?.failure();
    // }
    // return true;
  }

  onEditingComplete() {
    notifyListeners();
  }

  double filledPercent() {
    return controllers.where((e) => e.brandController.text.isNotEmpty && e.priceController.text.isNotEmpty).toList().length / controllers.length;
  }
}