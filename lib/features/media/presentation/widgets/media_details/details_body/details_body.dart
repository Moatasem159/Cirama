import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/widgets/main_button.dart';
import 'package:movies_app/core/widgets/read_more_widget.dart';
import 'package:movies_app/core/widgets/snack_bar.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/media/domain/entity/media.dart';
import 'package:movies_app/features/media/domain/entity/media_details.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_list_item.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';
import 'package:movies_app/features/media/domain/entity/movie.dart';
import 'package:movies_app/features/media/domain/entity/tv.dart';
import 'package:movies_app/features/media/presentation/cubits/get_media_details/get_media_detail_cubit.dart';
import 'package:movies_app/features/media/presentation/cubits/media_buttons/media_actions_bloc.dart';
import 'package:movies_app/features/media/presentation/widgets/media_details/details_body/credits_widgets/media_credits_widget.dart';
import 'package:movies_app/features/media/presentation/widgets/media_details/details_body/media_gallery/media_gallery.dart';
import 'package:movies_app/features/media/presentation/widgets/media_details/details_body/media_production_company/media_production_company_list.dart';
import 'package:movies_app/features/media/presentation/widgets/media_details/details_body/seasons_list_widgets/seasons_list.dart';
import 'package:movies_app/features/media/presentation/widgets/media_list_item_widget/media_list_item_widget.dart';
import 'package:movies_app/features/user/presentation/cubits/get_account_list/get_account_list_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'keyword_widgets/keyword_list_widget.dart';
part 'keyword_widgets/keyword_widget.dart';
part 'media_action_buttons/action_button.dart';
part 'media_action_buttons/favorite_button.dart';
part 'media_action_buttons/media_actions_button.dart';
part 'media_action_buttons/rate_button.dart';
part 'media_action_buttons/rating_dialog.dart';
part 'media_action_buttons/watchlist_button.dart';
part 'media_basic_info.dart';
part 'media_recommendations.dart';
part 'overview.dart';
part 'play_trailer_button.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: CustomScrollView(
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          const SliverToBoxAdapter(child: _MediaBasicInfoBlocBuilder()),
          const SliverToBoxAdapter(child: _MediaButtonsBlocBuilder()),
          const SliverToBoxAdapter(child: _PlayTrailerButtonBlocBuilder()),
          const SliverToBoxAdapter(child: _OverViewBlocBuilder()),
          const SliverToBoxAdapter(child: _KeywordListBlocBuilder()),
          const SliverToBoxAdapter(child: SeasonsBlocBuilder()),
          const SliverToBoxAdapter(child: CreditsBlocBuilder()),
          const SliverToBoxAdapter(child: MediaRecommendationsBlocBuilder()),
          const SliverToBoxAdapter(child: MediaGalleryBlocBuilder()),
          const SliverToBoxAdapter(child: ProductionCompaniesBlocBuilder()),
          const SliverVerticalSpace(10),
        ],
      ),
    );
  }
}