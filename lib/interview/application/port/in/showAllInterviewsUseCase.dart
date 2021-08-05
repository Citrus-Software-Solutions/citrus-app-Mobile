import 'package:citrus_app_mobile/interview/domain/interview.dart';

abstract class ShowAllInterviewsUseCase {
  Future<List<Interview>> showAllInterviews();
}
