import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/routing/app_router.dart';
import 'package:movies_app/core/widgets/white_spacing.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';

part 'list_container.dart';
part 'section_data.dart';
part 'section_title.dart';

class UserListSection extends StatelessWidget {
  final String sectionTitle;
  final IconData icon;
  final Color iconColor;
  final ContainerTitle movieTitle;
  final ContainerTitle tvTitle;

  const UserListSection({
    super.key,
    required this.sectionTitle,
    required this.icon,
    required this.movieTitle,
    required this.tvTitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: context.secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _SectionTitle(sectionTitle),
          VerticalSpace(16),
          _SectionData(
            icon: icon,
            iconColor: iconColor,
            movieTitle: movieTitle,
            tvTitle: tvTitle,
          )
        ],
      ),
    );
  }
}