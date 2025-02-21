// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String errorMessages(String code) {
    String _temp0 = intl.Intl.selectLogic(
      code,
      {
        'connectionTimeout': 'Connection timeout occurred.',
        'sendTimeout': 'Request timed out while sending data.',
        'receiveTimeout': 'Response timeout occurred.',
        'badCertificate': 'Invalid security certificate.',
        'badResponse': 'Received an invalid response from the server.',
        'cancelRequest': 'The request was cancelled.',
        'connectionError': 'Internet connection error.',
        'unKnownError': 'Something went wrong.Please try again.',
        'defaultError': 'Something went wrong.Please try again.',
        'other': 'Something went wrong.Please try again.',
      },
    );
    return '$_temp0';
  }

  @override
  String get welcomeToCirama => 'Welcome to Cirama';

  @override
  String get signInForTheBestExperience => 'Sign in for the best experience';

  @override
  String get keepTrackOfWhatYouWantToWatch => 'Keep track of what you want to watch';

  @override
  String get rateWhatYouHaveWatched => 'Rate what you have watched';

  @override
  String get markFavoriteWhatYouHaveWatched => 'Mark favorite what you have watched';

  @override
  String get letsStart => 'Let\'s start';

  @override
  String inMedia(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'movie': 'In Movies',
        'tv': 'In Tv shows',
        'other': 'In media',
      },
    );
    return '$_temp0';
  }

  @override
  String media(num count, String type) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'movie': 'Movies',
        'tv': 'Tv shows',
        'other': 'Media',
      },
    );
    String _temp1 = intl.Intl.selectLogic(
      type,
      {
        'movie': 'Movie',
        'tv': 'Tv show',
        'other': 'Media',
      },
    );
    String _temp2 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$_temp0',
      one: '$_temp1',
    );
    return '$_temp2';
  }

  @override
  String listType(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'now_playing': 'Playing now',
        'on_the_air': 'Playing now',
        'popular': 'Popular',
        'trending': 'Trending',
        'top_rated': 'Top Rated',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String onMediaListType(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'now_playing': 'On Playing now',
        'on_the_air': 'On Playing now',
        'popular': 'On popular',
        'trending': 'On trending',
        'top_rated': 'On top rated',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get seeMore => 'See more';

  @override
  String get seeLess => 'See less';

  @override
  String get noMore => 'No more items';

  @override
  String get budget => 'Budget';

  @override
  String get revenue => 'Revenue';

  @override
  String get status => 'Status';

  @override
  String get playTrailer => 'Play trailer';

  @override
  String get summary => 'Summary';

  @override
  String get type => 'Type';

  @override
  String seasons(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seasons',
      one: '1 season',
    );
    return '$_temp0';
  }

  @override
  String episodes(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String get numberOfSeasons => 'Number of seasons';

  @override
  String get numberOfEpisodes => 'Number of episodes';

  @override
  String get credits => 'Credits';

  @override
  String get cast => 'Cast';

  @override
  String get crew => 'Crew';

  @override
  String get productionCompanies => 'Production Companies';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get favorite => 'Favorite';

  @override
  String get rate => 'Rate';

  @override
  String get recommendations => 'Recommendations';

  @override
  String get gallery => 'Gallery';

  @override
  String get imageDownloaded => 'Image downloaded successfully';

  @override
  String imageTitle(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'backdrops': 'Backdrops',
        'posters': 'Posters',
        'logos': 'Logos',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get searchHint => 'Search for a movie ,tv show ,person......';

  @override
  String get noResults => 'No results found';

  @override
  String get recentSearch => 'Recent searches';

  @override
  String get clear => 'Clear';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get systemDefault => 'System default';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get changeLang => 'Change language';

  @override
  String get changeLangDialog => 'Change language requires closing the app and reopening it again. are you sure you want to do that?';

  @override
  String get agree => 'agree';

  @override
  String get disagree => 'disagree';

  @override
  String get appLanguage => 'App language';

  @override
  String get appTheme => 'App theme';

  @override
  String get ratings => 'Ratings';

  @override
  String get favorites => 'Favorites';

  @override
  String userLists(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'ratedMovies': 'Rated movies',
        'ratedTv': 'Rated TV shows',
        'favoriteMovies': 'Favorite movies',
        'favoriteTv': 'Favorite TV shows',
        'watchlistMovies': 'Movies watchlist',
        'watchlistTv': 'TV shows watchlist',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String emptyUserList(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'ratings': 'No ratings yet',
        'favorite': 'No favorites yet',
        'watchlist': 'No watchlist yet',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get logout => 'Log out';

  @override
  String get logoutDialog => 'Are you sure you want to log out?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get pleaseTryAgain => 'Please try again';
}
