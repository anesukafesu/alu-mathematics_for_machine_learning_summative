String? ageValidator(String? age) {
  if (age == null || age.isEmpty) {
    return 'Age cannot be empty';
  }

  double? numericAge = double.tryParse(age);

  if (numericAge == null) {
    return 'Age must be a numeric value';
  }

  if (numericAge < 0) {
    return 'Age cannot be less than zero';
  }

  return null;
}
