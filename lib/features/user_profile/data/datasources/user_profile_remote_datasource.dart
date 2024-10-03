import 'dart:io';

import 'package:glamee/core/error/exceptions.dart';
import 'package:glamee/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class UserProfileRemoteDatasource {
  Future<UserModel> completeUserProfile(
      UserModel user, );

  Future<String> uploadUserAvatar({
    required File image,
    required String userId,
  });
}

class UserProfileRemoteDatasourceImpl implements UserProfileRemoteDatasource {
  final SupabaseClient supabaseClient;

  UserProfileRemoteDatasourceImpl(this.supabaseClient);

  @override
  Future<UserModel> completeUserProfile(
      UserModel user) async {
    try {
      final userData = await supabaseClient
          .from('profiles')
          .update(user.toMap())
          .eq('id', user.id)
          .select();

      final updatedUser = UserModel.fromMap(userData.first);

   

   
      return updatedUser;
    } on PostgrestException catch (e) {

      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadUserAvatar(
      {required File image, required String userId}) async {
    try {
      await supabaseClient.storage.from('avatars').upload(
            userId,
            image,
          );

      return supabaseClient.storage.from('avatars').getPublicUrl(
            userId,
          );
    } on StorageException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
