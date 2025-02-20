import 'package:hive_ce/hive.dart';
import 'package:movies_app/features/search/data/models/search_model.dart';

part 'hive_adapters.g.dart';
@GenerateAdapters([AdapterSpec<MediaSearchModel>(), AdapterSpec<PersonSearchModel>()])
// ignore: unused_element
void _() {}