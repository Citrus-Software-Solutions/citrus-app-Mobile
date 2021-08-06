import 'package:citrus_app_mobile/interview/domain/interview.dart';
import 'package:citrus_app_mobile/user/domain/values/values.dart';

abstract class ShowAllInterviewsUseCase {
  Future<List<Interview>> showAllInterviews(UserId userId);
}
