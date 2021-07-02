class EmployeeName {
  final String _firstName;
  final String? _secondName;
  final String _lastName;
  final String? _secondLastName;

  EmployeeName(
      this._firstName, this._secondName, this._lastName, this._secondLastName);

  String get getFirstName => this._firstName.toString();

  String get getSecondName => this._secondName.toString();

  String get getLastName => this._lastName.toString();

  String get getSecondLastName => this._secondLastName.toString();

  String get getFullName =>
      this.getFirstName +
      " " +
      this.getSecondName +
      " " +
      this.getLastName +
      " " +
      this.getSecondLastName;
}
