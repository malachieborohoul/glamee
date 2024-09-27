

import 'package:glamee/core/common/entities/user.dart';
import 'package:glamee/core/usecase/usecase.dart';
import 'package:glamee/core/utils/typedef.dart';
import 'package:glamee/features/auth/domain/repositories/auth_repository.dart';

class SignUpWithGoogle implements UsecaseWithoutParams {
  final AuthRepository repository;

  SignUpWithGoogle(this.repository);
  @override
  ResultFuture<User> call()async {
     return await repository.signUpWithGoogle();
  }
}