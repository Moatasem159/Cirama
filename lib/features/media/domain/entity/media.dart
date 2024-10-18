abstract class Media {
  final int id;
  final num voteAverage;
  final num voteCount;
  final String name;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String originalName;
  final String backdropPath;
  final String originalLanguage;

  const Media({
    required this.id,
    required this.name,
    required this.overview,
    required this.originalName,
    required this.voteAverage,
    required this.voteCount,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.originalLanguage,
  });
}

extension MediaExtensions on Media {
  String getVoteAverage() {
    return voteAverage
        .toStringAsFixed(1)
        .replaceAll(RegExp(r'0*$'), '')
        .replaceAll(RegExp(r'\.$'), '');
  }

  String getVoteCount() {
    if (voteCount > 999999) {
      return "(${(voteCount / 1000000).toStringAsFixed(1)}M)";
    } else if (voteCount > 999) {
      return "(${(voteCount / 1000).toStringAsFixed(1)}K)";
    } else {
      return "$voteCount";
    }
  }
}

class Network {
  final int? id;
  final String name;
  final String? logoPath;

  const Network({
    required this.id,
    required this.name,
    this.logoPath,
  });
}

class Keyword {
  final int id;
  final String name;

  const Keyword({
    this.id = 0,
    this.name="empty name",
  });
}

extension KeywordExtensions on List<Keyword> {
  String keywordsToString(String separator) {
    return map((Keyword e) => e.name).join(" $separator ");
  }
}

class Video {
  final String id;
  final String name;
  final String key;
  final String site;
  final String type;
  final String publishedAt;
  final bool official;

  const Video({
    this.id = '',
    this.name = '',
    this.key = '',
    this.site = '',
    this.type = '',
    this.publishedAt = '',
    this.official = false,
  });
}

class Gallery {
  final List<ImageEntity> backdrops;
  final List<ImageEntity> logos;
  final List<ImageEntity> posters;

  const Gallery({
    this.backdrops = const [],
    this.logos = const [],
    this.posters = const [],
  });

  bool isNotEmpty() {
    return backdrops.isNotEmpty && logos.isNotEmpty && posters.isNotEmpty;
  }
}

class ImageEntity {
  final String? langCode;
  final String filePath;
  final num aspectRatio;
  final num height;
  final num width;

  const ImageEntity({
    this.langCode = '',
    this.filePath = '',
    this.width = 0,
    this.aspectRatio = 0,
    this.height = 0,
  });
}

enum ImageType {
  backdrops(height: 4.5, width: 0.9),
  posters(height: 3.68, width: 0.36),
  logos(height: 6.5, width: 0.7);

  final double height;
  final double width;

  const ImageType({required this.height, required this.width});
}

class MediaAccountDetails {
  final bool favorite;
  final num ratedValue;
  final bool watchlist;

  const MediaAccountDetails({
    this.favorite = false,
    this.ratedValue = 0,
    this.watchlist = false,
  });

  MediaAccountDetails copyWith({
    bool? favorite,
    num? ratedValue,
    bool? watchlist,
  }) {
    return MediaAccountDetails(
      favorite: favorite ?? this.favorite,
      ratedValue: ratedValue ?? this.ratedValue,
      watchlist: watchlist ?? this.watchlist,
    );
  }

  static MediaAccountDetails emptyMediaAccountDetails() {
    return const MediaAccountDetails(favorite: false, ratedValue: 0, watchlist: false);
  }
}