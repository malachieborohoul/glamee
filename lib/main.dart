import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glamee/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:glamee/core/theme/theme.dart';
import 'package:glamee/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:glamee/features/auth/presentation/screens/splash_screen.dart';
import 'package:glamee/features/user_profile/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:glamee/features/user_profile/presentation/cubits/complete_user_profile/complete_user_profile_cubit.dart';

import 'package:glamee/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
      BlocProvider(create: (_) => serviceLocator<CompleteUserProfileCubit>()),
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      BlocProvider(create: (_) => serviceLocator<UserProfileBloc>(),),


    ],
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "glamee",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      home: const SplashScreen(), // Affiche d'abord le Splash Screen
    );
  }
}