import 'package:cbc/data/models/market.dart';
import 'package:cbc/data/models/market_items.dart';

class Research {
  int? id;
  late String title;
  late bool isCompleted;
  late List<Market> markets;
  late List<MarketItems>? items;

  Research(
      {this.id,
      required this.title,
      required this.isCompleted,
      required this.markets,
      required this.items});

  Research.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isCompleted =
        json['isCompleted'] == null ? false : json['isCompleted'] as bool;
    markets = json['markets'] == null
        ? []
        : List<Map<String, dynamic>>.from(json['markets'])
            .map((e) => Market.fromJson(e))
            .toList();
    items = json['items'] == null
        ? []
        : List<Map<String, dynamic>>.from(json['items'])
            .map((e) => MarketItems.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'isCompleted': isCompleted,
        'markets': markets,
        'items': items
      };
}
