import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/utils/image_url.dart';
import 'package:movies_app/features/media/domain/entity/media.dart';
import 'package:movies_app/features/media/presentation/cubits/get_media_details/get_media_detail_cubit.dart';
import 'package:movies_app/features/media/presentation/widgets/media_details/details_body/custom_expansion_tile.dart';

part 'media_production_company.dart';

class ProductionCompaniesBlocBuilder extends StatelessWidget {
  const ProductionCompaniesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      builder: (BuildContext context, GetMediaDetailState state) {
        if (state is GetMediaDetailSuccess &&
            state.mediaDetails.productionCompanies.isNotEmpty) {
          return ProductionCompanyList(
            networks: state.mediaDetails.productionCompanies,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class ProductionCompanyList extends StatelessWidget {
  final List<Network> networks;

  const ProductionCompanyList({
    super.key,
    required this.networks,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: context.locale.productionCompanies,
      widgets: [
        SizedBox(
          height: 90,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: networks.length,
            itemBuilder: (BuildContext context, int index) =>
                _MediaProductionCompany(company: networks[index]),
          ),
        ),
      ],
    );
  }
}