part of 'account_app_bar.dart';

class _AccountAppBarWidget extends StatelessWidget {
  final AccountData account;
  final bool enabled;

  const _AccountAppBarWidget(this.account, this.enabled);

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Skeleton.replace(
              replacement: AvatarPlaceholder(),
              child: CachedNetworkImage(
                height: 50,
                width: 50,
                imageUrl: ImageUrl.logoUrl(account.avatar),
                imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) =>Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: context.primaryColor, width: 2),
                    shape: BoxShape.circle,
                    image: DecorationImage(image: imageProvider),
                  ),
                ),
                placeholder: (BuildContext context, String url) => AvatarPlaceholder(),
                errorWidget: (BuildContext context, String url, Object error) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Text(account.name == "" ? account.username[0] : account.name[0],
                          style: context.bodyLarge)),
                ),
              ),
            ),
          ),
          Text(account.name == "" ? account.username : account.name, style: context.titleMedium),
        ],
      ),
    );
  }
}

class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: Bone(
        width: 50,
        height: 50,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _AppBarError extends StatelessWidget {
  const _AppBarError();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(context.locale.errorMessages("defaultCode"),style: context.titleSmall,),
          IconButton(onPressed: context.read<GetAccountDataCubit>().getAccountData, icon: Icon(Icons.redo_rounded))
        ],
      ),
    );
  }
}