import 'package:flutter/material.dart';
import 'package:movies_app/features/media/domain/entity/media_enums.dart';
import 'package:movies_app/features/media/domain/entity/media_list_item.dart';
import 'package:movies_app/features/media/presentation/widgets/media_list_item_widget/media_list_item_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
class MediaVerticalList extends StatelessWidget {
  final List<MediaListItem> mediaList;
  final ListType listType;
  final bool enabled;
  const MediaVerticalList({super.key, required this.mediaList,required this.listType,this.enabled=false});
  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      ignorePointers: false,
      enabled: enabled,
      child: SliverGrid.builder(
        itemCount:mediaList.length,
        itemBuilder: (BuildContext context, int index) => MediaListItemWidget(media: mediaList[index],listType:listType),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .65,crossAxisCount: 3,mainAxisSpacing: 7)),
    );
  }
}