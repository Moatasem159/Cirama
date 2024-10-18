import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/user/presentation/widgets/welcome_screen/login_button.dart';
part 'option_widget.dart';
class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const VerticalSpace(80),
            Text(
              context.locale.welcomeToCirama,
              style: context.headlineMedium.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
            const VerticalSpace(10),
            Text(
              context.locale.signInForTheBestExperience,
              textAlign: TextAlign.center,
              style: context.titleLarge,
            ),
            const VerticalSpace(30),
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
            const VerticalSpace(30),
            const LoginButton(),
          ],
        ),
      ),
    );
  }
}