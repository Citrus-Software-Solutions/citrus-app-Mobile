import 'package:citrus_app_mobile/employer/domain/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/address.dart';

class Employer {
  final EmployerName _name;
  final Address _address;

  Employer(this._name, this._address);

  EmployerName get getName => this._name;

  String get getNameToString => this._name.getName;

  String get getAddressToString => this._address.toString();
}
