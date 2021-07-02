import 'package:citrus_app_mobile/jobOffer/domain/values/values.dart';
import 'package:citrus_app_mobile/employer/domain/employer.dart';

class JobOffer {
  final OfferId _id;
  final Employer _employer;
  final OfferName _name;
  final OfferDescription _description;
  final OfferStatus _status;
  final OfferGender _gender;
  final OfferSalary _salary;
  final OfferVacants _vacants;
  final OfferDateRange _dateRange;
  final OfferAgeRange _ageRange;
  final OfferLocation _location;

  JobOffer(
      this._id,
      this._employer,
      this._name,
      this._description,
      this._status,
      this._gender,
      this._salary,
      this._vacants,
      this._dateRange,
      this._ageRange,
      this._location);

  OfferId get getId => this._id;

  int? get getIdToInt => this._id.getId;

  String get getIdToString => this._id.getIdToString;

  Employer get getEmployer => this._employer;

  OfferName get getName => this._name;

  String get getNameToString => this._name.getName.toString();

  OfferDescription get getDescription => this._description;

  String get getDescriptionToString =>
      this._description.getDescription.toString();

  OfferStatus get getStatus => this._status;

  String get getStatusToString => this._status.getStatusToString;

  OfferSalary get getSalary => this._salary;

  String get getSalaryToString => this._salary.getSalaryToString;

  OfferVacants get getVacants => this._vacants;

  String get getVacantsToString => this._vacants.getVacantsToString;

  OfferGender get getGender => this._gender;

  String get getGenderToString => this._gender.getName.toString();

  OfferDateRange get getDateRange => this._dateRange;

  DateTime? get getBeginDate => this._dateRange.getBeginDate;

  DateTime? get getEndDate => this._dateRange.getEndDate;

  OfferAgeRange get getAgeRange => this._ageRange;

  int? get getMinAge => this._ageRange.getminAge;

  int? get getMaxAge => this._ageRange.getMaxAge;

  OfferLocation get getLocation => this._location;

  String get getLocationToString => this._location.getLocation;
}
