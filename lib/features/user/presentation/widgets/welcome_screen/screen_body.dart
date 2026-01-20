import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/features/user/presentation/widgets/welcome_screen/login_button.dart';

part 'option_widget.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        spacing: 24,
        children: [
          Text(
            context.locale.welcomeToCirama,
            style: context.headlineMedium.copyWith(
              color: context.theme.primaryColor,
              height: 1,
              fontWeight: .w600,
            ),
          ),
          Text(
            context.locale.signInForTheBestExperience,
            textAlign: TextAlign.center,
            style: context.titleLarge.copyWith(height: 1, fontWeight: .w500),
          ),
          _OptionWidget(
            icon: Icons.bookmark_add_outlined,
            text: context.locale.keepTrackOfWhatYouWantToWatch,
          ),
          _OptionWidget(
            icon: Icons.star_outline_rounded,
            text: context.locale.rateWhatYouHaveWatched,
          ),
          _OptionWidget(
            icon: Icons.favorite_border_rounded,
            text: context.locale.markFavoriteWhatYouHaveWatched,
          ),
          const LoginButton(),
        ],
      ),
    );
  }
}