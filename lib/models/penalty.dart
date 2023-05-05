import 'dart:ffi';

class PenaltyItem {
  int id;
  String description;
  List<Rule> rules;
  int sanctionValue;
  Bool referee;
  Bool judge;

  PenaltyItem(this.id, this.description, this.rules, this.sanctionValue,
      this.referee, this.judge);
}

class Rule {
  String ruleId;

  Rule(this.ruleId);
}

//    0 > ZeroPts
//    1 > MinusTwoPts
//    2 > MaxTwoPts
//    3 > MaxFourHalfPts
//    4 > MinusHalfToTwoPts
//    5 > JudgeOpinion
