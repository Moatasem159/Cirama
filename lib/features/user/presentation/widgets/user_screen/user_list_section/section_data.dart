part of 'user_list_section.dart';
class _SectionData extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final ContainerTitle movieTitle;
  final ContainerTitle tvTitle;
  const _SectionData({
    required this.icon,
    required this.movieTitle,
    required this.tvTitle,
    required this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _ListContainer(icon, movieTitle, iconColor),
        _ListContainer(icon, tvTitle, iconColor),
      ],
    );
  }
}