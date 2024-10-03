import 'dart:io';

import 'package:glamee/core/common/entities/user.dart';
import 'package:glamee/core/utils/typedef.dart';

abstract interface class UserProfileRepository {
  ResultFuture<User> completeUserProfile({
    required String id,
    required String email,
    required String name,
    required String gender,
    required int age,
    required String phoneNumber,
    required String countryCode,
    required File? image,
  });
}
