String? bmiValidator(String? bmi) {
  if (bmi == null || bmi.isEmpty) {
    return 'Body-Mass Index cannot be empty';
  }

  double? numericBmi = double.tryParse(bmi);

  if (numericBmi == null) {
    return 'Body-Mass Index must be valid numeric value';
  }

  if (numericBmi <= 0) {
    return 'Body-Mass Index must be greater than 0';
  }

  return null;
}
