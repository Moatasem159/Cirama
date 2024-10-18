import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/user/presentation/cubits/settings_cubit/settings_cubit.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (BuildContext context, SettingsState state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  context.locale.appTheme,
                  style: context.titleMedium.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              const VerticalSpace(6),
              Divider(),
              CheckboxListTile.adaptive(
                title: Text(context.locale.systemDefault),
                value: context.read<SettingsCubit>().isSystemTheme(),
                onChanged: (_) => context.read<SettingsCubit>().toSystemTheme(),
              ),
              const VerticalSpace(6),
              CheckboxListTile.adaptive(
                title: Text(context.locale.dark),
                value: context.read<SettingsCubit>().isDarkTheme(),
                onChanged: (_) => context.read<SettingsCubit>().toDarkTheme(),
              ),
              const VerticalSpace(6),
              CheckboxListTile.adaptive(
                title: Text(context.locale.light),
                value: context.read<SettingsCubit>().isLightTheme(),
                onChanged: (_) => context.read<SettingsCubit>().toLightTheme(),
              ),
            ],
          ),
        );
      },
    );
  }
}