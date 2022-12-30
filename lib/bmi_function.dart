import 'package:flutter/material.dart';

List calculateBMI(double height, double weight) {
  final double heightInCm = height / 100;
  final double bmi =
      double.parse((weight / (heightInCm * heightInCm)).toStringAsFixed(2));
  String status = "Error Occured";
  Color color = Colors.red;
  if (bmi <= 18.4) {
    status = "Underweight";
    color = const Color(0xFFFFE189);
  } else if (bmi > 18.4 && bmi <= 24.9) {
    status = "Normal";
    color = const Color(0xFF8CD47E);
  } else if (bmi > 24.9 && bmi <= 39.9) {
    status = "Overweight";
    color = const Color(0xFFFFB54C);
  } else {
    status = "Obese";
    color = const Color(0xFFFF6961);
  }
  return [bmi, status, color];
}
