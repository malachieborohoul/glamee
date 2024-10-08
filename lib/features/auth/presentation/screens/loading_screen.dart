import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glamee/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:glamee/core/common/widgets/loader.dart';
import 'package:glamee/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:glamee/features/auth/presentation/screens/signin_screen.dart';
import 'package:glamee/features/auth/presentation/screens/test.dart';
import 'package:glamee/features/user_profile/presentation/screens/select_gender_screen.dart';


class LoadingScreen extends StatefulWidget {
    static route() => PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const LoadingScreen(),
        );
      });
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
      // Future.delayed(const Duration(seconds: 2)); 
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocSelector<AppUserCubit, AppUserState, bool>(
      selector: (state) {
        return state is AppUserLoggedIn;
      },
      builder: (context, isLoggedIn) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              if(state.user.gender.isNotEmpty && state.user.age !=0 && state.user.countryCode.isNotEmpty 
              && state.user.phoneNumber.isNotEmpty){
                // L'utilisateur a réussi à s'authentifier
                Navigator.pushReplacement(context, Test.route());
              }else{
                
                Navigator.pushReplacement(context,  SelectGenderScreen.route());
                
              }
              
            } else if (state is AuthFailure || state is AuthInitial|| state is AuthSignOutSuccess) {
              // L'utilisateur n'est pas authentifié, redirection vers la page de connexion
              Navigator.pushReplacement(
                context,
                SigninScreen.route(),
              );
            }
          },
          child: const Center(
            child: Loader(),
          ),
        );
      },
    ));
  }
}
