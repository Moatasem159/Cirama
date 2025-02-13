import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/features/user/presentation/widgets/welcome_screen/screen_body.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(context),
      child: const SafeArea(
        child: Scaffold(
          body: WelcomeScreenBody(),
        ),
      ),
    );
  }
}