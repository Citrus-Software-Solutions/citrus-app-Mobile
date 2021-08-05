import 'package:citrus_app_mobile/employer/domain/employer.dart';
import 'package:citrus_app_mobile/jobOffer/domain/jobOffer.dart';

import 'package:citrus_app_mobile/employer/domain/values/values.dart';
import 'package:citrus_app_mobile/jobOffer/domain/values/values.dart';

class JobOfferMapper {
  static JobOffer mapToDomainEntityFromJson(Map<String, dynamic> json) {
    print(json);
    List<Skill> skills = [];
    for (var skill in json['skills']) {
      skills.add(Skill(skill['name'], skill['category']));
    }
    List<Schedule> schedules = [];
    for (var schedule in json['schedules']) {
      schedules.add(Schedule(DateTime.parse(schedule['init_date']),
          DateTime.parse(schedule['end_date'])));
    }

    return JobOffer(
        new OfferId(json['id']),
        new Employer(
            new EmployerName(json['employer']['company_name']),
            new Address(
                json['employer']['address']['street1'],
                json['employer']['address']['street2'],
                json['employer']['address']['city'],
                json['employer']['address']['state'],
                json['employer']['address']['_zip'])),
        new OfferName(json['title']),
        skills,
        new Address(
            json['location']['street1'],
            json['location']['street2'],
            json['location']['city'],
            json['location']['state'],
            json['location']['_zip']),
        new OfferDeadline(DateTime.parse(json['dead_line'])),
        schedules,
        new OfferRequirements(json['special_requirements']),
        new OfferDuration(json['duration']),
        new OfferHourlyRate(json['hourly_rate']));
  }
}
