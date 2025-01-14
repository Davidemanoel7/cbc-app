
import 'package:cbc/data/models/research.dart';
import 'package:cbc/providers/provider_base.dart';
import 'package:intl/intl.dart';

class ResearchViewModel extends ProviderBase {

  final Research? research;

  ResearchViewModel({this.research});

  int _currentTab = 0;

  int get currentTab => _currentTab;

  updateCurrentTab(int tab) {
    _currentTab = tab;
    notifyListeners();
  }

  String? formatPrice(double? price) {

    if (price == null) {
      return null;
    }
    
    String formattedValue = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2).format(price);

    return formattedValue;
  }
}