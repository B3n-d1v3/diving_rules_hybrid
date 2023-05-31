library diving_rules_hybrid.globals;

import 'package:diving_rules_hybrid/models/penalty_model.dart';
import 'package:diving_rules_hybrid/models/quiz_model.dart';
import 'package:diving_rules_hybrid/models/sanction_model.dart';
import 'package:diving_rules_hybrid/models/quiz_button_status.dart';

SanctionItems sanctionItems = SanctionItems(sanctions: []);
PenaltySummary penaltySummary = PenaltySummary(penalties: []);

// Quiz
var quizTotalQuestionNumber = 20;
var currentQuizScore = 0;
var currentQuizQuestionIndex = 0;

// The object with the current Quiz Data Logged in
var currentQuiz = Quiz();

// The object with the current question status display model
var penaltyButtonStatus = ButtonsStatus();
