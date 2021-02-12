import 'dart:convert';

import 'step_order.model.dart';

class BuildOrder {
  BuildOrder({
    this.titleEn,
    this.titleEs,
    this.reference,
    this.steps,
    this.favorite,
  });

  String titleEn;
  String titleEs;
  String reference;
  List<StepOrder> steps;
  bool favorite;

  factory BuildOrder.fromJson(String str) =>
      BuildOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BuildOrder.fromMap(Map<String, dynamic> json) => BuildOrder(
        titleEn: json["title_en"] == null ? null : json["title_en"],
        titleEs: json["title_es"] == null ? null : json["title_es"],
        reference: json["reference"] == null ? null : json["reference"],
        steps: json["steps"] == null
            ? null
            : List<StepOrder>.from(
                json["steps"].map((x) => StepOrder.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "title_en": titleEn == null ? null : titleEn,
        "title_es": titleEs == null ? null : titleEs,
        "reference": reference == null ? null : reference,
        "steps": steps == null
            ? null
            : List<dynamic>.from(steps.map((x) => x.toMap())),
      };
}
