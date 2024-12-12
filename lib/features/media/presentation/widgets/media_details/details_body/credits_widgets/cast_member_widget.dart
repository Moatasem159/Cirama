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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
        child: Column(
          spacing: 4,
          children: [
            CachedNetworkImage(
              height: 60,
              width: 60,
              imageUrl: ImageUrl.logoUrl(member.profilePath ?? ''),
              imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) =>Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (BuildContext context, String url) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              errorWidget: (BuildContext context, String url, Object error) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Icon(Icons.person),
              ),
            ),
            Text(
              member.name,
              style: context.titleSmall.copyWith(
                fontWeight: FontWeight.w400,
              ),
              textScaler: TextScaler.linear(context.screenWidth / 350),
            ),
          ],
        ),
      ),
    );
  }
}