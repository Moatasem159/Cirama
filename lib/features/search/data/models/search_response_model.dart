import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/features/search/data/models/search_model.dart';

part 'search_response_model.g.dart';

@JsonSerializable(createToJson: false)
class SearchResponseModel {
  final int page;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @SearchModelConverter()
  final List<SearchModel> results;
  @JsonKey(name: "total_results")
  final int totalResults;

  const SearchResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseModelFromJson(json);
}