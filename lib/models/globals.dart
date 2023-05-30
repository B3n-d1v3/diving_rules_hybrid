library diving_rules_hybrid.globals;

import 'package:diving_rules_hybrid/models/penalty_model.dart';
import 'package:diving_rules_hybrid/models/sanction_model.dart';

SanctionItems sanctionItems = SanctionItems(sanctions: []);
PenaltySummary penaltySummary = PenaltySummary(penalties: []);

// Quiz
var quizzTotalQuestionNumber = 20;
var currentQuizScore = 0;
var currentQuizQuestionIndex = 0;
