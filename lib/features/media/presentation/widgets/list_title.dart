import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const ListTitle({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Skeleton.keep(
              child: Text(
            title,
            style: context.titleSmall,
            textScaler: TextScaler.linear(context.screenWidth / 350),
          )),
          if (onPressed != null)
            Skeleton.ignore(
              child: GestureDetector(
                onTap: onPressed,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.locale.seeMore,
                      style: context.labelMedium
                          .copyWith(fontWeight: FontWeight.normal),
                      textScaler: TextScaler.linear(context.screenWidth / 350),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: context.theme.textTheme.labelMedium!.color,
                      size: context.screenWidth / 30,
                      opticalSize: 15
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}