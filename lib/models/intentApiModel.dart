// To parse this JSON data, do
//
//     final intentApi = intentApiFromJson(jsonString);

import 'dart:convert';

IntentApi intentApiFromJson(String str) => IntentApi.fromJson(json.decode(str));

String intentApiToJson(IntentApi data) => json.encode(data.toJson());

class IntentApi {
  String amount;
  double confidence;
  String intent;
  String name;

  IntentApi({
    this.amount,
    this.confidence,
    this.intent,
    this.name,
  });

  factory IntentApi.fromJson(Map<String, dynamic> json) => IntentApi(
        amount: json["amount"],
        confidence: json["confidence"].toDouble(),
        intent: json["intent"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "confidence": confidence,
        "intent": intent,
        "name": name,
      };
}
