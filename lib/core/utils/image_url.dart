abstract class _ImageBaseUrl{
  static const String basePosterUrl = "https://image.tmdb.org/t/p/w500";
  static const String baseBackDropsUrl = "https://image.tmdb.org/t/p/w780";
  static const String baseLogoUrl = "https://image.tmdb.org/t/p/w185";
  static const String baseHdUrl = "https://image.tmdb.org/t/p/w1280";
}
abstract class ImageUrl{
  static String backDropsUrl(String path) =>
      "${_ImageBaseUrl.baseBackDropsUrl}$path";
  static String posterUrl(String path) =>
      "${_ImageBaseUrl.basePosterUrl}$path";
  static String logoUrl(String path) =>
      "${_ImageBaseUrl.baseLogoUrl}$path";
  static String hdUrl(String path) =>
      "${_ImageBaseUrl.baseHdUrl}$path";
}