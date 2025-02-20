// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) =>
    SearchResponseModel(
      page: (json['page'] as num).toInt(),
      results:
          (json['results'] as List<dynamic>)
              .map(
                (e) => const SearchModelConverter().fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );
