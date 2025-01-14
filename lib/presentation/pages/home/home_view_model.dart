import 'package:cbc/core/constants/global_widgets.dart';
import 'package:cbc/data/models/market.dart';
import 'package:cbc/data/models/market_items.dart';
import 'package:cbc/data/models/research.dart';
import 'package:cbc/data/services/rest_service.dart';
import 'package:cbc/presentation/pages/home/home_repository.dart';
import 'package:cbc/providers/provider_base.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends ProviderBase {
  List<Research> researches = [
    Research(id: 12312, title: "Janeiro/2025", isCompleted: false, markets: [
      Market(id: "2", name: "Santa Rita", isCompleted: false),
      Market(id: "3", name: "LigZarb", isCompleted: false),
      Market(id: "4", name: "Paulinos", isCompleted: true),
      Market(id: "1", name: "Pare e Compre", isCompleted: true)
    ], items: []),
    Research(id: 12312, title: "Dezembro/2024", isCompleted: true, markets: [
      Market(id: "2", name: "Santa Rita", isCompleted: true),
      Market(id: "3", name: "LigZarb", isCompleted: true),
      Market(id: "4", name: "Paulinos", isCompleted: true),
      Market(id: "1", name: "Pare e Compre", isCompleted: true),
    ], items: [
      MarketItems(title: 'Arroz', price: 5.50),
      MarketItems(title: 'Feijão', price: 5.50),
      MarketItems(title: 'Carne', price: 45.50),
      MarketItems(title: 'Leite', price: 5.50),
      MarketItems(title: 'Manteiga', price: 5.50),
      MarketItems(title: 'Farinha', price: 5.50),
      MarketItems(title: 'Tomate', price: 5.50),
      MarketItems(title: 'Banana', price: 5.50),
      MarketItems(title: 'Pão', price: 5.50),
      MarketItems(title: 'Café', price: 5.50),
      MarketItems(title: 'Óleo', price: 5.50),
      MarketItems(title: 'Açúcar', price: 5.50),

    ]),
    Research(id: 12312, title: "Novembro/2024", isCompleted: true, markets: [
      Market(id: "2", name: "Santa Rita", isCompleted: true),
      Market(id: "3", name: "LigZarb", isCompleted: true),
      Market(id: "4", name: "Paulinos", isCompleted: true),
      Market(id: "1", name: "Pare e Compre", isCompleted: true)
    ], items: [
      MarketItems(title: 'Arroz', price: 5.50),
      MarketItems(title: 'Feijão', price: 5.50),
      MarketItems(title: 'Carne', price: 45.50),
      MarketItems(title: 'Leite', price: 5.50),
      MarketItems(title: 'Manteiga', price: 5.50),
      MarketItems(title: 'Farinha', price: 5.50),
      MarketItems(title: 'Tomate', price: 5.50),
      MarketItems(title: 'Banana', price: 5.50),
      MarketItems(title: 'Pão', price: 5.50),
      MarketItems(title: 'Café', price: 5.50),
      MarketItems(title: 'Óleo', price: 5.50),
      MarketItems(title: 'Açúcar', price: 5.50),

    ]),
    Research(id: 12312, title: "Outubro/2024", isCompleted: true, markets: [
      Market(id: "2", name: "Santa Rita", isCompleted: true),
      Market(id: "3", name: "LigZarb", isCompleted: true),
      Market(id: "4", name: "Paulinos", isCompleted: true),
      Market(id: "1", name: "Pare e Compre", isCompleted: true)
    ], items: [
      MarketItems(title: 'Arroz', price: 5.50),
      MarketItems(title: 'Feijão', price: 5.50),
      MarketItems(title: 'Carne', price: 45.50),
      MarketItems(title: 'Leite', price: 5.50),
      MarketItems(title: 'Manteiga', price: 5.50),
      MarketItems(title: 'Farinha', price: 5.50),
      MarketItems(title: 'Tomate', price: 5.50),
      MarketItems(title: 'Banana', price: 5.50),
      MarketItems(title: 'Pão', price: 5.50),
      MarketItems(title: 'Café', price: 5.50),
      MarketItems(title: 'Óleo', price: 5.50),
      MarketItems(title: 'Açúcar', price: 5.50),

    ])
  ];


  final HomeRepository repository;

  List<Research> pendingResearches = [];
  List<Research> completedResearches = [];

  HomeViewModel({ HomeRepository? repository }) : repository = repository ?? HomeRepository(RestService())  {
    _onLoad();
  }

  void _onLoad() async {

    // var result = await repository.getResearches();

    // if (result.isSuccess) {
    //   FullResponse response = result.success;

    //   List<Research> researchList = response.decodeList(Research.fromJson);

    //   if (researchList.isNotEmpty) {
    //     researches.addAll(researchList);

        pendingResearches = researches.where((e) => !e.isCompleted).toList();
        completedResearches = researches.where((e) => e.isCompleted).toList();

        notifyListeners();
    //   }
    // } else {
    //   onFailure("Não foi possível carregar as pesquisas");
    // }
  }
  
  Research? createNewResearch() {

    DateTime now = DateTime.now();

    String formattedData = DateFormat('MMMM/yyyy', 'pt_BR').format(now);

    if (researches.where((e) => e.title == capitalizeFirstLetter(formattedData)).toList().isNotEmpty) {
      return null;
    }

    Research newResearch = Research(title: capitalizeFirstLetter(formattedData), isCompleted: false, markets: [
      Market(id: "2", name: "Santa Rita", isCompleted: false),
      Market(id: "3", name: "LigZarb", isCompleted: false),
      Market(id: "4", name: "Paulinos", isCompleted: false),
      Market(id: "1", name: "Pare e Compre", isCompleted: false)
    ], items: []);

    print(newResearch.title);

    return newResearch;
  }

}
