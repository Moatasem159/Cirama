import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/animations_route/custom_modal_route.dart';
import 'package:movies_app/core/utils/app_constant.dart';
import 'package:movies_app/features/home/presentation/screens/home_screen.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/presentation/screens/image_fullscreen.dart';
import 'package:movies_app/features/media/presentation/screens/media_details_screen.dart';
import 'package:movies_app/features/media/presentation/screens/media_screen.dart';
import 'package:movies_app/features/media/presentation/screens/media_web_screen.dart';
import 'package:movies_app/features/media/presentation/screens/season_details_screen.dart';
import 'package:movies_app/features/media/presentation/screens/see_more_media_screen.dart';
import 'package:movies_app/features/media/presentation/screens/trailer_screen.dart';
import 'package:movies_app/features/search/presentation/screens/search_screen.dart';
import 'package:movies_app/features/user/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:movies_app/features/user/presentation/cubits/get_account_list/get_account_list_cubit.dart';
import 'package:movies_app/features/user/presentation/screens/account_list_screen.dart';
import 'package:movies_app/features/user/presentation/screens/login_screen.dart';
import 'package:movies_app/features/user/presentation/screens/settings_screen.dart';
import 'package:movies_app/features/user/presentation/screens/user_screen.dart';
import 'package:movies_app/features/user/presentation/screens/welcome_screen.dart';
import 'package:movies_app/features/user/presentation/widgets/settings_screen/language_bottom_sheet.dart';
import 'package:movies_app/features/user/presentation/widgets/settings_screen/theme_bottom_sheet.dart';

part 'animations_route/horizontal_slide.dart';
part 'animations_route/scale_from_center.dart';
part 'animations_route/slide_from_down_to_up.dart';
part 'animations_route/slide_from_up_to_down.dart';
part 'app_router.g.dart';
part 'home_shell.dart';
part 'media_details_route.dart';
part 'movie_route.dart';
part 'search_route.dart';
part 'tv_shows_route.dart';
part 'user_route.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class AppRouter {
  final GoRouter  router =GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: $appRoutes,
  );
}

@TypedGoRoute<InitialRoute>(path: '/')
class InitialRoute extends GoRouteData with _$InitialRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const WelcomeScreen();

  @override
  FutureOr<String> redirect(BuildContext context, GoRouterState state) {
    if (AppConstants.sessionId.isNotEmpty) {
      return '/movie';
    } else {
      return '/';
    }
  }
}

@TypedGoRoute<LoginRoute>(path: '/login/:requestToken')
class LoginRoute extends GoRouteData with _$LoginRoute {
  final AuthCubit $extra;
  final String requestToken;

  const LoginRoute({required this.$extra, required this.requestToken});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return HorizontalSlide(
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
        direction: AppConstants.appLanguage == "en" ? SlideDirection.right : SlideDirection.left,
        child: BlocProvider<AuthCubit>.value(
            value: $extra, child: LoginScreen(requestToken: requestToken)));
  }
}