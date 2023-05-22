import 'dart:convert';
import 'dart:ffi';

// JSON decoding automatically generated with https://app.quicktype.io/
// To parse this JSON data, do
//     final sanctionItems = sanctionItemsFromJson(jsonString);

SanctionItems sanctionItemsFromJson(String str) =>
    SanctionItems.fromJson(json.decode(str));

String sanctionItemsToJson(SanctionItems data) => json.encode(data.toJson());

class SanctionItems {
  List<Sanction> sanctions;

  SanctionItems({
    required this.sanctions,
  });

  factory SanctionItems.fromJson(Map<String, dynamic> json) => SanctionItems(
        sanctions: List<Sanction>.from(
            json["sanctions"].map((x) => Sanction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sanctions": List<dynamic>.from(sanctions.map((x) => x.toJson())),
      };
}

class Sanction {
  int id;
  String description;
  String icon;
  String buttonText;

  Sanction({
    required this.id,
    required this.description,
    required this.icon,
    required this.buttonText,
  });

  factory Sanction.fromJson(Map<String, dynamic> json) => Sanction(
        id: json["id"],
        description: json["description"],
        icon: json["icon"],
        buttonText: json["button_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "icon": icon,
        "button_text": buttonText,
      };
}

// Fetch content from the json file
/*
Future<void> initSanctionFromJson() async {
  final String response =
      await rootBundle.loadString('assets/data/divingPenaltiesSanctions.json');
  final data = await json.decode(response);
  setState(() {
    sanctions = data["sanctions"];
    debugPrint("initSanctionFromJson: nb items loaded: ${sanctions.length}");
  });
}*/

// the penalty sanction status of all available options
class PenaltySanction {
  Bool zeroPts;
  Bool maxTwoPts;
  Bool maxFourHalfPts;
  Bool minusTwoPts;
  Bool minusHalfToTwoPts;
  Bool judgeOpinion;

  PenaltySanction(this.zeroPts, this.maxTwoPts, this.maxFourHalfPts,
      this.minusTwoPts, this.minusHalfToTwoPts, this.judgeOpinion);
}
