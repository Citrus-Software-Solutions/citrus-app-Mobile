import 'package:citrus_app_mobile/user/domain/values/userId.dart';
import 'dart:math';

class UserIdMother {
  UserId create(int userId) {
    return UserId(userId);
  }

  UserId random() {
    Random rand = Random();
    int radomId = rand.nextInt(100);

    return this.create(radomId);
  }
}
