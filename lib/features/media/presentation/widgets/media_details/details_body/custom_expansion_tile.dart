import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> widgets;

  const CustomExpansionTile({
    super.key,
    required this.widgets,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      dense: true,
      title: Text(
        title,
        style: context.titleMedium,
      ),
      minTileHeight: 5,
      childrenPadding: EdgeInsets.only(left: 6, right: 6,bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: context.primaryColor, width: 0.5),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: context.primaryColor, width: 0.5),
      ),
      tilePadding: EdgeInsets.symmetric(horizontal: 5),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      children: widgets,
    );
  }
}