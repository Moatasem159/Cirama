import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/user/presentation/cubits/get_account_data_cubit/get_account_data_cubit.dart';
import 'package:movies_app/features/user/presentation/widgets/custom_list_tile.dart';
import 'package:movies_app/features/user/presentation/widgets/user_screen/account_app_bar/account_app_bar.dart';
import 'package:movies_app/features/user/presentation/widgets/user_screen/user_list_section/user_list_section.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAccountDataCubit>(
      create: (BuildContext context) => GetAccountDataCubit(GetIt.I.get())..getAccountData(),
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          children: [
            const VerticalSpace(8),
            const AccountAppBar(),
            const VerticalSpace(10),
            CustomListTile(
              onTap: ()=>SettingsRoute().push(context),
              leading: Icon(Icons.settings_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: context.locale.settings,
            ),
            UserListSection(
              sectionTitle: context.locale.ratings,
              icon: Icons.stars_rounded,
              iconColor: Colors.yellow,
              movieTitle: ContainerTitle.ratedMovies,
              tvTitle: ContainerTitle.ratedTv,
            ),
            UserListSection(
              sectionTitle: context.locale.favorites,
              icon: Icons.favorite_border_rounded,
              iconColor: Colors.red,
              movieTitle: ContainerTitle.favoriteMovies,
              tvTitle: ContainerTitle.favoriteTv,
            ),
            UserListSection(
              sectionTitle: context.locale.watchlist,
              icon: Icons.bookmarks_rounded,
              iconColor: Colors.green,
              movieTitle: ContainerTitle.watchlistMovies,
              tvTitle: ContainerTitle.watchlistTv,
            ),
          ],
        ),
      ),
    );
  }
}