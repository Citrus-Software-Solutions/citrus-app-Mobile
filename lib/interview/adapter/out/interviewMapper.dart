import 'package:citrus_app_mobile/interview/domain/values/values.dart';
import 'package:citrus_app_mobile/interview/domain/interview.dart';

class InterviewMapper {
  static Interview mapToDomainEntityFromJson(Map<String, dynamic> json) {
    return Interview(
        new InterviewId(json['id']),
        new StartDate(DateTime.parse(json['date'])),
        new AccessURL(json['accessURL']),
        new InterviewStatus(json['status']),
        new Duration(int.parse(json['duration'])));
  }
}
