import 'dart:io';

import 'package:glamee/core/common/entities/user.dart';
import 'package:glamee/core/usecase/usecase.dart';
import 'package:glamee/core/utils/typedef.dart';
import 'package:glamee/features/user_profile/domain/repositories/user_profile_repository.dart';

class CompleteUserProfile implements Usecase<User, CompleteUserProfileParams> {
  final UserProfileRepository userProfileRepository;

  CompleteUserProfile(this.userProfileRepository);
  @override
  ResultFuture<User> call(CompleteUserProfileParams params) async {
    return await userProfileRepository.completeUserProfile(
        id: params.id,
        email: params.email,
        name: params.name,
        gender: params.gender,
        age: params.age,
        phoneNumber: params.phoneNumber,
        countryCode: params.countryCode,
        image: params.image,
        );
  }
}

class CompleteUserProfileParams {
  
  final String id;
  final String email;
  final String name;
  final String gender;
  final int age;
  final String phoneNumber;
  final String countryCode;
  final File? image;

  const CompleteUserProfileParams({
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    required this.countryCode,
    required this.image,
  });

 
}
