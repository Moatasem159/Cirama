import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/features/user/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:movies_app/features/user/presentation/widgets/welcome_screen/screen_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(GetIt.I.get()),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppTheme.systemUiOverlayStyle(context),
        child: const SafeArea(
          child: Scaffold(
            body: WelcomeScreenBody(),
          ),
        ),
      ),
    );
  }
}