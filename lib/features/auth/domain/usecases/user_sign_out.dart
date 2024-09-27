

import 'package:glamee/core/usecase/usecase.dart';
import 'package:glamee/core/utils/typedef.dart';
import 'package:glamee/features/auth/domain/repositories/auth_repository.dart';

class UserSignOut implements UsecaseWithoutParams<void> {
  final AuthRepository authRepository;

  UserSignOut(this.authRepository);
  @override
  ResultFuture<void> call() async{
    return await authRepository.signOut();
  }
}

