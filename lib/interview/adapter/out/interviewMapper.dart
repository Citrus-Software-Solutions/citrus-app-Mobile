import 'package:citrus_app_mobile/interview/domain/values/values.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';

class InterviewMapper {
  static Interview mapToDomainEntityFromJson(Map<String, dynamic> json) {
    return Interview(
        new InterviewId(json['id']),
        new StartDate(json['date']),
        new AccessURL(json['accessURL']),
        new InterviewStatus(json['status']),
        new Duration(json['duration']));
  }
}
