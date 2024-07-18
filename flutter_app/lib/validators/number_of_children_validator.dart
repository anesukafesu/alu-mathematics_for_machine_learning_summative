String? numberOfChildrenValidator(String? numberOfChildren) {
  if (numberOfChildren == null || numberOfChildren.isEmpty) {
    return 'Number of children/dependents cannot be empty';
  }

  int? numericNumberOfChildren = int.tryParse(numberOfChildren);

  if (numericNumberOfChildren == null) {
    return 'Number of children/dependents must be an integer';
  }

  if (numericNumberOfChildren < 0) {
    return 'Number of children/dependents cannot be less than 0';
  }

  return null;
}
