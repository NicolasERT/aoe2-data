import 'dart:convert';

class StepOrder {
  StepOrder({
    this.orderEn,
    this.orderEs,
    this.image,
    this.pop,
    this.totalPop,
    this.wood,
    this.food,
    this.gold,
    this.stone,
    this.villager,
  });

  String orderEn;
  String orderEs;
  String image;
  int pop;
  int totalPop;
  int wood;
  int food;
  int gold;
  int stone;
  String villager;

  factory StepOrder.fromJson(String str) => StepOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StepOrder.fromMap(Map<String, dynamic> json) => StepOrder(
        orderEn: json["order_en"] == null ? null : json["order_en"],
        orderEs: json["order_es"] == null ? null : json["order_es"],
        image: json["image"] == null ? null : json["image"],
        pop: json["pop"] == null ? null : json["pop"],
        totalPop: json["total_pop"] == null ? null : json["total_pop"],
        wood: json["wood"] == null ? null : json["wood"],
        food: json["food"] == null ? null : json["food"],
        gold: json["gold"] == null ? null : json["gold"],
        stone: json["stone"] == null ? null : json["stone"],
        villager: json["villager"] == null ? null : json["villager"],
      );

  Map<String, dynamic> toMap() => {
        "order_en": orderEn == null ? null : orderEn,
        "order_es": orderEs == null ? null : orderEs,
        "image": image == null ? null : image,
        "pop": pop == null ? null : pop,
        "total_pop": totalPop == null ? null : totalPop,
        "wood": wood == null ? null : wood,
        "food": food == null ? null : food,
        "gold": gold == null ? null : gold,
        "stone": stone == null ? null : stone,
        "villager": villager == null ? null : villager,
      };
}
