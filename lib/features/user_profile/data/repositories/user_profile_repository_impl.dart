import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:glamee/core/error/exceptions.dart';
import 'package:glamee/core/error/failures.dart';
import 'package:glamee/core/utils/typedef.dart';
import 'package:glamee/features/auth/data/models/user_model.dart';
import 'package:glamee/features/user_profile/data/datasources/user_profile_remote_datasource.dart';
import 'package:glamee/features/user_profile/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDatasource userProfileRemoteDatasource;

  UserProfileRepositoryImpl(this.userProfileRemoteDatasource);
  @override
  ResultFuture<UserModel> completeUserProfile(
      {required String id,
      required String email,
      required String name,
      required String gender,
      required int age,
      required String phoneNumber,
      required String countryCode,
      required File? image,
      }) async {
    try {
      UserModel userModel = UserModel(
          id: id,
          email: email,
          name: name,
          updatedAt: DateTime.now(),
          gender: gender,
          age: age,
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          avatar: '');


    if (image != null){
      final imageUrl = await userProfileRemoteDatasource.uploadUserAvatar(
          image: image, userId: id);
      userModel = userModel.copyWith(avatar: imageUrl);

    }
      


      final user = await userProfileRemoteDatasource.completeUserProfile(userModel);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
