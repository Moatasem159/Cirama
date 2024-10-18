part of 'media_credits_widget.dart';

class CastMemberWidget extends StatelessWidget {
  final CastMember member;

  const CastMemberWidget({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: navigate to person details
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.4, color: context.primaryColor),
          borderRadius: BorderRadius.circular(6),
        ),
        constraints: BoxConstraints(maxWidth: 160),
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: ImageUrl.logoUrl(member.profilePath ?? ''),
              imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) =>Container(
                height: 110,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image:
                  DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (BuildContext context, String url) => Container(
                height: 110,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              errorWidget: (BuildContext context, String url, error) => Container(
                height: 110,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey,
                ),
                child: Icon(Icons.person),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                child: ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(overscroll: false),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Text(
                        member.name,
                        style: context.titleSmall,
                        textScaler: TextScaler.linear(context.screenWidth / 350),
                      ),
                      Text(
                        member.character ?? member.job!,
                        style: context.labelSmall,
                        textScaler: TextScaler.linear(context.screenWidth / 350),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}