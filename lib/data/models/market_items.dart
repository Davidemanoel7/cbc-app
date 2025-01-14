class MarketItems {
  late String title;
  late double price;

  MarketItems({required this.title, required this.price});

  MarketItems.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() => {'title': title, 'price': price};
}
