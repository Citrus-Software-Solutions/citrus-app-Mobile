import 'package:citrus_app_mobile/jobOffer/domain/values/values.dart';
import 'package:citrus_app_mobile/employer/domain/employer.dart';

class JobOffer {
  final OfferId _id;
  final OfferName _name;
  final Address _address;
  final OfferDeadline _deadline;
  final List<Schedule> _schedules;
  final List<Skill> _skills;
  final OfferRequirements _requirements;
  final OfferDuration _duration;
  final OfferHourlyRate _hourlyRate;
  final Employer _employer;

  JobOffer(
      this._id,
      this._employer,
      this._name,
      this._skills,
      this._address,
      this._deadline,
      this._schedules,
      this._requirements,
      this._duration,
      this._hourlyRate);

  OfferId get getId => this._id;

  int? get getIdToInt => this._id.getId;

  String get getIdToString => this._id.toString();

  Employer get getEmployer => this._employer;

  OfferName get getName => this._name;

  String get getNameToString => this._name.toString();

  Address get getAddress => this._address;

  String get getAddressToString => this._address.toString();

  String get getCityToString => this._address.city;

  OfferDeadline get getDeadline => this._deadline;

  String get getDeadlineToString => this._deadline.toString();

  List<Schedule> get getSchedules => this._schedules;

  List<Skill> get getSkills => this._skills;

  OfferRequirements get getRequirements => this._requirements;

  String get getRequirementsToString => this._requirements.toString();

  OfferDuration get getDuration => this._duration;

  String get getDurationToString => this._duration.toString();

  OfferHourlyRate get getHourlyRate => this._hourlyRate;

  String get getHourlyRateToString => this._hourlyRate.toString();
}
