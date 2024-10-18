enum SearchType { person, movie, tv }
abstract class SearchEntity {
  final int id;
  final SearchType mediaType;
  final String name;
  final String originalName;
  final String releaseDate;
  final String profilePath;
  const SearchEntity({
    required this.id,
    required this.mediaType,
    required this.name,
    required this.originalName,
    required this.releaseDate,
    required this.profilePath,
  });
}
extension SearchEntityExtensions on SearchEntity {
  String getName() {
    if (releaseDate.length>4) {
      return "$name (${releaseDate.substring(0, 4)})";
    }
    else {
      return name;
    }
  }
}
abstract class MediaSearch extends SearchEntity {
  final String overview;
  final String backdropPath;

  const MediaSearch({
    required this.overview,
    required this.backdropPath,
    required super.id,
    required super.mediaType,
    required super.name,
    required super.originalName,
    required super.releaseDate,
    required super.profilePath,
  });
}
class MovieSearch extends MediaSearch {
  const MovieSearch({
    required super.overview,
    required super.backdropPath,
    required super.id,
    required super.mediaType,
    required super.name,
    required super.originalName,
    required super.releaseDate,
    required super.profilePath,
  });
}
class TvSearch extends MediaSearch {
  const TvSearch({
    required super.overview,
    required super.backdropPath,
    required super.id,
    required super.mediaType,
    required super.name,
    required super.originalName,
    required super.releaseDate,
    required super.profilePath,
  });


}
class PersonSearch extends SearchEntity {
  final String ?department;
  final List<SearchEntity> knownFor;

  const PersonSearch({
    required this.department,
    required this.knownFor,
    required super.id,
    required super.mediaType,
    required super.name,
    required super.originalName,
    required super.releaseDate,
    required super.profilePath,
  });

}