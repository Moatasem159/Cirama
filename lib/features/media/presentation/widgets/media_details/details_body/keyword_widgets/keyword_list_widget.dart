part of '../details_body.dart';
class _KeywordListBlocBuilder extends StatelessWidget {
  const _KeywordListBlocBuilder();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMediaDetailCubit, GetMediaDetailState>(
      buildWhen: _shouldRebuild,
      builder: (BuildContext context, GetMediaDetailState state) {
        if (state is GetMediaDetailSuccess) {
          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 6,
            runSpacing: 6,
            children: state.mediaDetails.keywords
                .map((Keyword e) => _KeywordWidget(keyword: e))
                .toList(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
  bool _shouldRebuild(GetMediaDetailState previous, GetMediaDetailState current) {
    return current is GetMediaDetailSuccess || current is GetMediaDetailLoading|| current is GetMediaDetailError;
  }
}