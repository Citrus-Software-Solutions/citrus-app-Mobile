import 'package:citrus_app_mobile/employer/domain/values/values.dart';
import 'package:citrus_app_mobile/user/values/values.dart';

import 'package:citrus_app_mobile/user/user.dart';

class Employer extends User {
  final EmployerId employerId;
  final EmployerName name;

  Employer(UserAuth auth, UserId id, UserLocation location, this.employerId,
      this.name)
      : super(auth, id, location);
}
