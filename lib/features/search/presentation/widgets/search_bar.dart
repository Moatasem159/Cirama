part of 'screen_body.dart';
class _CustomSearchBar extends StatefulWidget {
  const _CustomSearchBar();
  @override
  State<_CustomSearchBar> createState() => _CustomSearchBarState();
}
class _CustomSearchBarState extends State<_CustomSearchBar> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller=TextEditingController();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 20,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: SearchBar(
          controller: _controller,
          leading: Icon(
            Icons.search_rounded,
            color: context.theme.primaryColor,
          ),
          hintStyle: WidgetStatePropertyAll(
            context.labelMedium.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          hintText: context.locale.searchHint,
          trailing: [
            IconButton(
              onPressed: () {
                _controller.clear();
                context.read<SearchBloc>().add(LocalSearch());
              },
              icon: Icon(Icons.clear_rounded),
              color: context.theme.primaryColor,
            ),
          ],
          backgroundColor: WidgetStatePropertyAll(context.scaffoldBackgroundColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (String value) =>context.read<SearchBloc>().add(Search(query: value)),
        )
        ),
      );
  }
}