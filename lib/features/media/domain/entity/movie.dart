import 'package:intl/intl.dart';
import 'package:movies_app/features/media/domain/entity/cast.dart';
import 'package:movies_app/features/media/domain/entity/media.dart';
import 'package:movies_app/features/media/domain/entity/media_details.dart';
import 'package:movies_app/features/media/domain/entity/media_list_response.dart';

class Movie extends MediaDetails {
  final num budget;
  final num revenue;

  const Movie({
    this.budget = 0,
    this.revenue = 0,
    super.id = 0,
    super.voteAverage = 0,
    super.voteCount = 0,
    super.name = "empty name",
    super.overview = "empty overview proj f o offtrack ofk pok fps poke okf pk fpkvjfoekfoef",
    super.tagline = 'this is tagline',
    super.posterPath = '',
    super.releaseDate = '0000-00-00',
    super.originalName = "empty original name",
    super.backdropPath = '',
    super.originalLanguage = '',
    super.runtime = 0,
    super.status = 'released kskskd',
    super.homepage = '',
    super.genres = const [
      Keyword(),
      Keyword(),
      Keyword(),
    ],
    super.keywords = const [],
    super.productionCompanies = const [],
    super.gallery = const Gallery(),
    super.logoPath = const ImageEntity(),
    super.trailer = const Video(),
    super.credits = const Credits(),
    super.mediaAccountDetails = const MediaAccountDetails(),
    super.recommendations = const MediaListResponse(),
  });
}

extension MovieExtensions on Movie {
  String getBudget() {
    final NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    if (budget == 0) {
      return "-----------";
    } else {
      return "\$${myFormat.format(budget)}";
    }
  }

  String getRevenue() {
    final NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    if (revenue == 0) {
      return "-----------";
    } else {
      return "\$${myFormat.format(revenue)}";
    }
  }

  String getRuntime() {
    if (runtime != 0) {
      return "${runtime ~/ 60 == 0 ? '' : '${runtime ~/ 60}h'}"
          " ${runtime % 60 == 0 ? "" : "${runtime % 60}m"}";
    }
    return '';
  }
}