import 'package:citrus_app_mobile/interview/domain/values/values.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';

class InterviewMapper {
  static Interview mapToDomainEntityFromJson(Map<String, dynamic> json) {
    return Interview(
        new InterviewId(json['id']),
        new StartDate(DateTime.parse(json['startDate'])),
        new AccessURL(json['accessURL']),
        new InterviewStatus(json['status']),
        new Duration(json['duration']),
        new InterviewTitle(json['application']['job_Offer']['title']));
  }
}
