part of 'media_production_company_list.dart';

class _MediaProductionCompany extends StatelessWidget {
  final Network company;

  const _MediaProductionCompany({required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: context.primaryColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: ImageUrl.logoUrl(company.logoPath ?? ''),
            imageBuilder: (context, imageProvider) => Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: imageProvider,

                ),
              ),
            ),
            placeholder: (context, url) => const SizedBox(
              width: 90,
              height: 90,
            ),
            errorWidget: (BuildContext context, String url, Object error) =>
                Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(Icons.error_outline_rounded),
            ),
          ),
          HorizontalSpace(6),
          Text(
            company.name,
            style: context.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}