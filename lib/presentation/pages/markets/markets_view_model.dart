import 'package:cbc/data/models/research.dart';
import 'package:cbc/providers/provider_base.dart';

class MarketsViewModel extends ProviderBase {

  final Research? research;

  MarketsViewModel({this.research});

  int? selectedIndex;

  select(int index) {
    selectedIndex = index;
    notifyListeners();
  }

}