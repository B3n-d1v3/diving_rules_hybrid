import 'dart:convert';

// JSON decoding automatically generated with https://app.quicktype.io/
// To parse this JSON data, do
//     final penaltySummary = penaltySummaryFromJson(jsonString);

PenaltySummary penaltySummaryFromJson(String str) =>
    PenaltySummary.fromJson(json.decode(str));

String penaltySummaryToJson(PenaltySummary data) => json.encode(data.toJson());

class PenaltySummary {
  List<Penalty> penalties;

  PenaltySummary({
    required this.penalties,
  });

  factory PenaltySummary.fromJson(Map<String, dynamic> json) => PenaltySummary(
        penalties: List<Penalty>.from(
            json["penalties"].map((x) => Penalty.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "penalties": List<dynamic>.from(penalties.map((x) => x.toJson())),
      };
}

class Penalty {
  int id;
  String description;
  List<Rule> rules;
  int sanctionValue;
  bool referee;
  bool judge;

  Penalty({
    required this.id,
    required this.description,
    required this.rules,
    required this.sanctionValue,
    required this.referee,
    required this.judge,
  });

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
        id: json["id"],
        description: json["description"],
        rules: List<Rule>.from(json["rules"].map((x) => Rule.fromJson(x))),
        sanctionValue: json["sanctionValue"],
        referee: json["referee"],
        judge: json["judge"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "rules": List<dynamic>.from(rules.map((x) => x.toJson())),
        "sanctionValue": sanctionValue,
        "referee": referee,
        "judge": judge,
      };
}

class Rule {
  String ruleId;

  Rule({
    required this.ruleId,
  });

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
        ruleId: json["ruleId"],
      );

  Map<String, dynamic> toJson() => {
        "ruleId": ruleId,
      };
}

//    0 > ZeroPts
//    1 > MinusTwoPts
//    2 > MaxTwoPts
//    3 > MaxFourHalfPts
//    4 > MinusHalfToTwoPts
//    5 > JudgeOpinion
