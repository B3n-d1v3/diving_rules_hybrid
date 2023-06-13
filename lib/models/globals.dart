library diving_rules_hybrid.globals;

import 'package:diving_rules_hybrid/models/penalty_model.dart';
import 'package:diving_rules_hybrid/models/quiz_button_status.dart';
import 'package:diving_rules_hybrid/models/quiz_model.dart';
import 'package:diving_rules_hybrid/models/sanction_model.dart';
import 'package:get/get.dart';

SanctionItems sanctionItems = SanctionItems(sanctions: []);
PenaltySummary penaltySummary = PenaltySummary(penalties: []);

// Quiz
var quizTotalQuestionNumber = 20;
var currentQuizScore = 0;
var currentQuizQuestionIndex = 0;
var currentQuizNextQuestion = false;

// The object with the current Quiz Data Logged in
var currentQuiz = Quiz();

// The object with the current question status display model
//var penaltyButtonStatus = ButtonsStatus();
// Testing Getx controller setup
final currentPenaltyStatus = Get.put(ButtonsStatus());

// controller class to control state of the UI
// class HomeController extends GetxController {}
//
// class HomeBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put<HomeController>(HomeController());
//   }
// }
