import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  static BmiController get to => Get.put(BmiController());

  final _bmi = 0.obs;

  get bmi => _bmi.value;

  set bmi(value) {
    _bmi.value = value;
  }

  final _finalBmi = "".obs;

  get finalBmi => _finalBmi.value;

  set finalBmi(value) {
    _finalBmi.value = value;
  }

  final _gender = "Male".obs;

  get gender => _gender.value;

  set gender(value) {
    _gender.value = value;
  }

  final _age = 0.obs;

  get age => _age.value;

  set age(value) {
    _age.value = value;
  }

  final _dailyCaloire = "".obs;

  get dailyCaloire => _dailyCaloire.value;

  set dailyCaloire(value) {
    _dailyCaloire.value = value;
  }

  final _weightResult = "".obs;

  get weightResult => _weightResult.value;

  set weightResult(value) {
    _weightResult.value = value;
  }

  final _advise = "".obs;

  get advise => _advise.value;

  set advise(value) {
    _advise.value = value;
  }

  final _showBmiResult = false.obs;

  get showBmiResult => _showBmiResult.value;

  set showBmiResult(value) {
    _showBmiResult.value = value;
  }

  String calculateBMI({required height, required weight}) {
    var bmi = (weight / pow(height / 100, 2));
    var toStringAsFixed = double.parse(bmi.toStringAsFixed(2));
    var convertToString = toStringAsFixed.toString();
    finalBmi = convertToString;
    return bmi.toStringAsFixed(1);
  }

  String getText() {
    var onePointOne = double.parse(finalBmi);
    if (onePointOne >= 25) {
      weightResult = "OVER WEIGHT";
    } else if (onePointOne > 18.5) {
      weightResult = "NORMAL";
    } else {
      weightResult = "UNDERWEIGHT";
    }
    return weightResult;
  }

  String getAdvise() {
    var onePointOne = double.parse(finalBmi);
    if (onePointOne >= 25) {
      advise = "You have a more than normal body weight";
    } else if (onePointOne > 18.5) {
      advise = "You have a normal body weight";
    } else {
      advise = "You have a lower than normal body weight";
    }
    return advise;
  }

  Color getTextColor() {
    var onePointOne = double.parse(finalBmi);

    if (onePointOne >= 25) {
      return Colors.red;
    } else if (onePointOne <= 18.5) {
      return Colors.green;
    } else {
      return Colors.deepPurpleAccent;
    }
  }

  dailyCalorieIntake({required weight, required height}) {
    if (gender == "Male") {
      dailyCaloire = (weight * 10) + (height * 6.25) - (age * 5) + 5;
    } else {
      dailyCaloire = (weight * 10) + (height * 6.25) - (age * 5) - 161;
    }
    return dailyCaloire;
  }
}
