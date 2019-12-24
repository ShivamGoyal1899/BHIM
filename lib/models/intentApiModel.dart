// To parse this JSON data, do
//
//     final intentApi = intentApiFromJson(jsonString);

import 'dart:convert';

IntentApi intentApiFromJson(String str) => IntentApi.fromJson(json.decode(str));

String intentApiToJson(IntentApi data) => json.encode(data.toJson());

class IntentApi {
  Intent intent;
  List<Entity> entities;
  List<Intent> intentRanking;
  String text;

  IntentApi({
    this.intent,
    this.entities,
    this.intentRanking,
    this.text,
  });

  factory IntentApi.fromJson(Map<String, dynamic> json) => IntentApi(
        intent: Intent.fromJson(json["intent"]),
        entities:
            List<Entity>.from(json["entities"].map((x) => Entity.fromJson(x))),
        intentRanking: List<Intent>.from(
            json["intent_ranking"].map((x) => Intent.fromJson(x))),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "intent": intent.toJson(),
        "entities": List<dynamic>.from(entities.map((x) => x.toJson())),
        "intent_ranking":
            List<dynamic>.from(intentRanking.map((x) => x.toJson())),
        "text": text,
      };
}

class Entity {
  int start;
  int end;
  String value;
  String entity;
  double confidence;
  String extractor;

  Entity({
    this.start,
    this.end,
    this.value,
    this.entity,
    this.confidence,
    this.extractor,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        start: json["start"],
        end: json["end"],
        value: json["value"],
        entity: json["entity"],
        confidence: json["confidence"].toDouble(),
        extractor: json["extractor"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
        "value": value,
        "entity": entity,
        "confidence": confidence,
        "extractor": extractor,
      };
}

class Intent {
  String name;
  double confidence;

  Intent({
    this.name,
    this.confidence,
  });

  factory Intent.fromJson(Map<String, dynamic> json) => Intent(
        name: json["name"],
        confidence: json["confidence"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "confidence": confidence,
      };
}
