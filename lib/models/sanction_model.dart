import 'dart:convert';

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
  bool zeroPts;
  bool maxTwoPts;
  bool maxFourHalfPts;
  bool minusTwoPts;
  bool minusHalfToTwoPts;
  bool judgeOpinion;

  PenaltySanction(this.zeroPts, this.maxTwoPts, this.maxFourHalfPts,
      this.minusTwoPts, this.minusHalfToTwoPts, this.judgeOpinion);
}

// function to setup the PenaltySanction from the SanctionModel of the penalty
PenaltySanction setPenaltySanction({required int penaltyNb}) {
  final tempPenaltySanction =
      PenaltySanction(false, false, false, false, false, false);
  switch (penaltyNb) {
    case 0:
      tempPenaltySanction.zeroPts = true;
      break;
    case 1:
      tempPenaltySanction.maxTwoPts = true;
      break;
    case 2:
      tempPenaltySanction.maxFourHalfPts = true;
      break;
    case 3:
      tempPenaltySanction.minusTwoPts = true;
      break;
    case 4:
      tempPenaltySanction.minusHalfToTwoPts = true;
      break;
    case 5:
      tempPenaltySanction.judgeOpinion = true;
      break;
  }
  return tempPenaltySanction;
}
