import 'package:hive/hive.dart';
import 'package:movies_app/features/search/data/models/search_model.dart';

class SearchLocalDataSource {
  final Box<SearchModel> _searchBox;

  const SearchLocalDataSource(this._searchBox);

  Future<void> saveSearch(SearchModel searchModel) async{
    if(!_searchBox.keys.any((element) => element==searchModel.id)){
      await _searchBox.put(searchModel.id, searchModel);
    }
  }

  Future<void> deleteSearch(SearchModel searchModel) async => await _searchBox.delete(searchModel.id);

  List<SearchModel> getAllSearch() => _searchBox.values.toList();

  Future<void> clearAllSearch() async => _searchBox.clear();
}