
class Market {
  String? id;
  String? name;
  late bool isCompleted;

  Market({ this.id, this.name, bool? isCompleted }) : isCompleted = isCompleted ?? false;

  Market.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isCompleted = json['isCompleted'] == null ? false : json['isCompleted'] as bool;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'isCompleted': isCompleted 
  };
}