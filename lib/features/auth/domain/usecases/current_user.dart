

import 'package:glamee/core/usecase/usecase.dart';
import 'package:glamee/core/utils/typedef.dart';
import 'package:glamee/features/auth/domain/repositories/auth_repository.dart';

class CurrentUser implements UsecaseWithoutParams {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);
  @override
  ResultFuture call() async {
        return await authRepository.currentUser();

  }
}