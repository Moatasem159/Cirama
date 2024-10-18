import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/features/search/presentation/cubits/search_bloc/search_bloc.dart';
import 'package:movies_app/features/search/presentation/widgets/screen_body.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (BuildContext context) => SearchBloc(GetIt.I.get())..add(LocalSearch()),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SearchScreenBody(),
      ),
    );
  }
}