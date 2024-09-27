import 'package:get_it/get_it.dart';
import 'package:glamee/features/user_profile/data/datasources/user_profile_remote_datasource.dart';
import 'package:glamee/features/user_profile/data/repositories/user_profile_repository_impl.dart';
import 'package:glamee/features/user_profile/domain/repositories/user_profile_repository.dart';
import 'package:glamee/features/user_profile/domain/usecases/complete_user_profile.dart';
import 'package:glamee/features/user_profile/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:glamee/features/user_profile/presentation/cubits/complete_user_profile/complete_user_profile_cubit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:glamee/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:glamee/core/secrets/app_secrets.dart';
import 'package:glamee/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:glamee/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:glamee/features/auth/domain/repositories/auth_repository.dart';
import 'package:glamee/features/auth/domain/usecases/current_user.dart';
import 'package:glamee/features/auth/domain/usecases/sign_up_with_apple.dart';
import 'package:glamee/features/auth/domain/usecases/sign_up_with_google.dart';
import 'package:glamee/features/auth/domain/usecases/user_sign_in.dart';
import 'package:glamee/features/auth/domain/usecases/user_sign_out.dart';
import 'package:glamee/features/auth/domain/usecases/user_sign_up.dart';
import 'package:glamee/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

part 'init_dependencies.main.dart';