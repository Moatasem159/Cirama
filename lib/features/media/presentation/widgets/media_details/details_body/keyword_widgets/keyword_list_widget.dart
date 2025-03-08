part of '../details_body.dart';
class _KeywordListBlocBuilder extends StatelessWidget {
  const _KeywordListBlocBuilder();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      builder: (BuildContext context, GetMediaDetailState state) {
        if (state is GetMediaDetailSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 6,
              runSpacing: 8,
              children: state.mediaDetails.keywords
                  .map((Keyword e) => _KeywordWidget(keyword: e))
                  .toList(),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}