import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @errorMessages.
  ///
  /// In en, this message translates to:
  /// **'{code, select, connectionTimeout {Connection timeout occurred.} sendTimeout {Request timed out while sending data.} receiveTimeout {Response timeout occurred.} badCertificate {Invalid security certificate.} badResponse {Received an invalid response from the server.} cancelRequest {The request was cancelled.} connectionError {Internet connection error.} unKnownError {Something went wrong.Please try again.} defaultError {Something went wrong.Please try again.} other {Something went wrong.Please try again.}}'**
  String errorMessages(String code);

  /// No description provided for @welcomeToCirama.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Cirama'**
  String get welcomeToCirama;

  /// No description provided for @signInForTheBestExperience.
  ///
  /// In en, this message translates to:
  /// **'Sign in for the best experience'**
  String get signInForTheBestExperience;

  /// No description provided for @keepTrackOfWhatYouWantToWatch.
  ///
  /// In en, this message translates to:
  /// **'Keep track of what you want to watch'**
  String get keepTrackOfWhatYouWantToWatch;

  /// No description provided for @rateWhatYouHaveWatched.
  ///
  /// In en, this message translates to:
  /// **'Rate what you have watched'**
  String get rateWhatYouHaveWatched;

  /// No description provided for @markFavoriteWhatYouHaveWatched.
  ///
  /// In en, this message translates to:
  /// **'Mark favorite what you have watched'**
  String get markFavoriteWhatYouHaveWatched;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start'**
  String get letsStart;

  /// No description provided for @inMedia.
  ///
  /// In en, this message translates to:
  /// **'{type, select,movie{In Movies} tv{In Tv shows} other{In media}}'**
  String inMedia(String type);

  /// A plural message for movies or TV shows
  ///
  /// In en, this message translates to:
  /// **'{count, plural,=1{{type, select,movie{Movie} tv{Tv show} other{Media}}} other{{type, select, movie{Movies} tv{Tv shows} other{Media}}}}'**
  String media(num count, String type);

  /// No description provided for @listType.
  ///
  /// In en, this message translates to:
  /// **'{type, select, now_playing {Playing now} on_the_air {Playing now} popular {Popular} trending {Trending} top_rated {Top Rated}other{}}'**
  String listType(String type);

  /// No description provided for @onMediaListType.
  ///
  /// In en, this message translates to:
  /// **'{type, select, now_playing {On Playing now} on_the_air {On Playing now} popular {On popular} trending {On trending} top_rated {On top rated}other{}}'**
  String onMediaListType(String type);

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seeMore;

  /// No description provided for @seeLess.
  ///
  /// In en, this message translates to:
  /// **'See less'**
  String get seeLess;

  /// No description provided for @noMore.
  ///
  /// In en, this message translates to:
  /// **'No more items'**
  String get noMore;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// No description provided for @revenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenue;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @playTrailer.
  ///
  /// In en, this message translates to:
  /// **'Play trailer'**
  String get playTrailer;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @seasons.
  ///
  /// In en, this message translates to:
  /// **'{count, plural,=1 {1 season} other {{count} seasons}}'**
  String seasons(num count);

  /// No description provided for @episodes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural,=1 {1 episode} other {{count} episodes}}'**
  String episodes(num count);

  /// No description provided for @numberOfSeasons.
  ///
  /// In en, this message translates to:
  /// **'Number of seasons'**
  String get numberOfSeasons;

  /// No description provided for @numberOfEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Number of episodes'**
  String get numberOfEpisodes;

  /// No description provided for @credits.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get credits;

  /// No description provided for @cast.
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get cast;

  /// No description provided for @crew.
  ///
  /// In en, this message translates to:
  /// **'Crew'**
  String get crew;

  /// No description provided for @productionCompanies.
  ///
  /// In en, this message translates to:
  /// **'Production Companies'**
  String get productionCompanies;

  /// No description provided for @watchlist.
  ///
  /// In en, this message translates to:
  /// **'Watchlist'**
  String get watchlist;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @imageDownloaded.
  ///
  /// In en, this message translates to:
  /// **'Image downloaded successfully'**
  String get imageDownloaded;

  /// No description provided for @imageTitle.
  ///
  /// In en, this message translates to:
  /// **'{type,select,backdrops{Backdrops}posters{Posters}logos{Logos} other{}}'**
  String imageTitle(String type);

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for a movie ,tv show ,person......'**
  String get searchHint;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResults;

  /// No description provided for @recentSearch.
  ///
  /// In en, this message translates to:
  /// **'Recent searches'**
  String get recentSearch;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemDefault;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @changeLang.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLang;

  /// No description provided for @changeLangDialog.
  ///
  /// In en, this message translates to:
  /// **'Change language requires closing the app and reopening it again. are you sure you want to do that?'**
  String get changeLangDialog;

  /// No description provided for @agree.
  ///
  /// In en, this message translates to:
  /// **'agree'**
  String get agree;

  /// No description provided for @disagree.
  ///
  /// In en, this message translates to:
  /// **'disagree'**
  String get disagree;

  /// No description provided for @appLanguage.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLanguage;

  /// No description provided for @appTheme.
  ///
  /// In en, this message translates to:
  /// **'App theme'**
  String get appTheme;

  /// No description provided for @ratings.
  ///
  /// In en, this message translates to:
  /// **'Ratings'**
  String get ratings;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @userLists.
  ///
  /// In en, this message translates to:
  /// **'{type, select, ratedMovies {Rated movies} ratedTv {Rated TV shows}favoriteMovies {Favorite movies} favoriteTv {Favorite TV shows} watchlistMovies {Movies watchlist} watchlistTv {TV shows watchlist}  other{}}'**
  String userLists(String type);

  /// No description provided for @emptyUserList.
  ///
  /// In en, this message translates to:
  /// **'{type, select,ratings{No ratings yet} favorite {No favorites yet} watchlist {No watchlist yet}other{}}'**
  String emptyUserList(String type);

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @logoutDialog.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutDialog;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @pleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Please try again'**
  String get pleaseTryAgain;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
