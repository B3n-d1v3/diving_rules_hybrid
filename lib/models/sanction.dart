import 'dart:ffi';

// the sanction that can be applied with it's corresponding icon name
class SanctionItem {
  int id;
  String description;
  String icon;

  SanctionItem(this.id, this.description, this.icon);
}

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
