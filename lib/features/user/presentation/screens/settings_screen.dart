import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/user/presentation/cubits/settings_cubit/settings_cubit.dart';
import 'package:movies_app/features/user/presentation/widgets/custom_list_tile.dart';
import 'package:movies_app/features/user/presentation/widgets/settings_screen/log_out_button.dart';
import 'package:movies_app/features/user/presentation/widgets/settings_screen/version.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(context),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Text(context.locale.settings),
            titleTextStyle: context.titleMedium.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          body: Column(
            children: [
              CustomListTile(
                onTap: () => ChangeLanguageRoute().push(context),
                leading: Icon(Icons.language_rounded),
                title: context.locale.language,
                subtitle: context.read<SettingsCubit>().getLocalName(context),
              ),
              BlocBuilder<SettingsCubit, SettingsState>(
                buildWhen: (SettingsState previous, SettingsState current) =>
                    previous.themeMode != current.themeMode,
                builder: (BuildContext context, SettingsState state) => CustomListTile(
                  onTap: () => ChangeThemeRoute().push(context),
                  leading: Icon(Icons.color_lens_outlined),
                  title: context.locale.theme,
                  subtitle: context.read<SettingsCubit>().getThemeModeName(context),
                ),
              ),
              VerticalSpace(10),
              LogOutButton(),
              Spacer(),
              Version(),
            ],
          ),
        ),
      ),
    );
  }
}