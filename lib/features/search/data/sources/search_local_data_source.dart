import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/search/data/models/search_model.dart';

/// A local data source class for managing search operations using Hive.
/// This class provides methods for saving, deleting, retrieving, and clearing search models.
@lazySingleton
class SearchLocalDataSource {
  const SearchLocalDataSource();

  /// Retrieves all saved search models from local storage.
  ///
  /// Returns a list of [SearchModel] objects stored in the Hive box.
  List<SearchModel> get getAllSearch => Hive.box<SearchModel>("searchBox").values.toList();

  /// Saves a [SearchModel] to the local storage.
  ///
  /// This method checks if the search model already exists in the box before saving.
  /// If the model's ID is not found, it saves the model using its ID as the key.
  ///
  /// Parameters:
  /// - [searchModel]: The search model to save.
  Future<void> saveSearch(SearchModel searchModel) async {
    Box<SearchModel> searchBox = Hive.box<SearchModel>("searchBox");
    if (!searchBox.keys.any((element) => element == searchModel.id)) {
      await searchBox.put(searchModel.id, searchModel);
    }
  }

  /// Deletes a [SearchModel] from the local storage.
  ///
  /// This method removes the search model identified by its ID.
  ///
  /// Parameters:
  /// - [searchModel]: The search model to delete.
  Future<void> deleteSearch(SearchModel searchModel) async =>
      await Hive.box<SearchModel>("searchBox").delete(searchModel.id);

  /// Clears all search models from local storage.
  ///
  /// This method deletes all entries in the Hive box, removing all saved search models.
  Future<void> clearAllSearch() async => Hive.box<SearchModel>("searchBox").clear();
}