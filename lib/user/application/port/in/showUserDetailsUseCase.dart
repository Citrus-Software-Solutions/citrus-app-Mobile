import 'package:citrus_app_mobile/user/user.dart';
import 'package:citrus_app_mobile/user/domain/values/userId.dart';

abstract class ShowUserDetailsUseCase {
  Future<User> showDetailJobOffer(UserId offerId);
}
