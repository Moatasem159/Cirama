part of '../details_body.dart';
class _KeywordWidget extends StatelessWidget {
  final Keyword keyword;
  const _KeywordWidget({required this.keyword});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: context.isDark?Colors.white24:Colors.black12
        ,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        keyword.name,
        style: context.labelMedium.copyWith(
          fontWeight: FontWeight.normal
        ),
      ),
    );
  }
}