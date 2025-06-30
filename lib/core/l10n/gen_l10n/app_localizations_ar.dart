// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String errorMessages(String code) {
    String _temp0 = intl.Intl.selectLogic(code, {
      'connectionTimeout': 'انتهت مهلة الاتصال.',
      'sendTimeout': 'انتهت مهلة الطلب أثناء إرسال البيانات.',
      'receiveTimeout': 'انتهت مهلة الاستجابة.',
      'badCertificate': 'شهادة أمان غير صالحة.',
      'badResponse': 'تم استقبال استجابة غير صالحة من الخادم.',
      'cancelRequest': 'تم إلغاء الطلب.',
      'connectionError': 'خطأ في الاتصال بالإنترنت.',
      'unKnownError': 'حدث خطأ ما. يرجى المحاولة مرة أخرى.',
      'defaultError': 'حدث خطأ ما. يرجى المحاولة مرة أخرى.',
      'other': 'حدث خطأ ما. يرجى المحاولة مرة أخرى.',
    });
    return '$_temp0';
  }

  @override
  String get welcomeToCirama => 'مرحبًا بك في Cirama';

  @override
  String get signInForTheBestExperience =>
      'قم بتسجيل الدخول للحصول على أفضل تجربة';

  @override
  String get keepTrackOfWhatYouWantToWatch => 'تابع ما تريد مشاهدته';

  @override
  String get rateWhatYouHaveWatched => 'قم بتقييم ما شاهدته';

  @override
  String get markFavoriteWhatYouHaveWatched =>
      'ضع علامة على ما تفضله مما شاهدته';

  @override
  String get letsStart => 'لنبدأ';

  @override
  String inMedia(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'movie': 'في الأفلام',
      'tv': 'في البرامج التليفزيونية',
      'other': 'في الوسائط',
    });
    return '$_temp0';
  }

  @override
  String media(num count, String type) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String _ = countNumberFormat.format(count);

    String _temp0 = intl.Intl.selectLogic(type, {
      'movie': 'أفلام',
      'tv': 'برامج تليفزيونية',
      'other': 'وسائط',
    });
    String _temp1 = intl.Intl.selectLogic(type, {
      'movie': 'فيلم',
      'tv': 'برنامج تليفزيوني',
      'other': 'وسائط',
    });
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
    String _temp0 = intl.Intl.selectLogic(type, {
      'now_playing': 'يعرض الآن',
      'on_the_air': 'يعرض الآن',
      'popular': 'المشهورة',
      'trending': 'شائع',
      'top_rated': 'الأعلى تقييمًا',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String onMediaListType(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'now_playing': 'يعرض على الآن',
      'on_the_air': 'يعرض على الآن',
      'popular': 'على المشهورة',
      'trending': 'على الشائع',
      'top_rated': 'على الأعلى تقييمًا',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get seeMore => 'انظر المزيد';

  @override
  String get seeLess => 'انظر أقل';

  @override
  String get noMore => 'لا مزيد من العناصر';

  @override
  String get budget => 'الميزانية';

  @override
  String get revenue => 'الإيرادات';

  @override
  String get status => 'الحالة';

  @override
  String get playTrailer => 'تشغيل المقطع الدعائي';

  @override
  String get summary => 'ملخص';

  @override
  String get type => 'النوع';

  @override
  String seasons(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مواسم',
      one: 'موسم واحد',
    );
    return '$_temp0';
  }

  @override
  String episodes(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حلقات',
      one: 'حلقة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get numberOfSeasons => 'عدد المواسم';

  @override
  String get numberOfEpisodes => 'عدد الحلقات';

  @override
  String get credits => 'طاقم العمل';

  @override
  String get cast => 'الممثلون';

  @override
  String get crew => 'الفريق';

  @override
  String get productionCompanies => 'شركات الإنتاج';

  @override
  String get watchlist => 'قائمة المشاهدة';

  @override
  String get favorite => 'مفضل';

  @override
  String get rate => 'قيم';

  @override
  String get recommendations => 'توصيات';

  @override
  String get gallery => 'معرض الصور';

  @override
  String get imageDownloaded => 'تم تنزيل الصورة بنجاح';

  @override
  String imageTitle(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'backdrops': 'الخلفية',
      'posters': 'الملصقات',
      'logos': 'الشعارات',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get searchHint => 'ابحث عن فيلم أو برنامج تليفزيوني أو شخص......';

  @override
  String get noResults => 'لم يتم العثور على نتائج';

  @override
  String get recentSearch => 'عمليات البحث الحديثة';

  @override
  String get clear => 'مسح';

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get theme => 'المظهر';

  @override
  String get dark => 'داكن';

  @override
  String get light => 'فاتح';

  @override
  String get systemDefault => 'الوضع الافتراضي للنظام';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get changeLang => 'تغيير اللغة';

  @override
  String get changeLangDialog =>
      'تغيير اللغة يتطلب إغلاق التطبيق وإعاده فتحه مرة اخري. هل انت متأكد انك تريد أن تفعل ذلك؟';

  @override
  String get agree => 'موافق';

  @override
  String get disagree => 'غير موافق';

  @override
  String get appLanguage => 'لغة التطبيق';

  @override
  String get appTheme => 'مظهر التطبيق';

  @override
  String get ratings => 'التقييمات';

  @override
  String get favorites => 'المفضلة';

  @override
  String userLists(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'ratedMovies': 'الأفلام المُصنّفة',
      'ratedTv': 'البرامج التلفزيونية المُصنّفة',
      'favoriteMovies': 'الأفلام المفضلة',
      'favoriteTv': 'البرامج التلفزيونية المفضلة',
      'watchlistMovies': 'أفلام قائمة المشاهدة',
      'watchlistTv': 'برامج تلفزيونية في قائمة المشاهدة',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String emptyUserList(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'ratings': 'لا يوجد تقييمات بعد',
      'favorite': 'لا يوجد مفضلات بعد',
      'watchlist': 'لا يوجد قائمة مراقبة بعد',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get logoutDialog => 'هل أنت متأكد من أنك تريد تسجيل الخروج؟';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get pleaseTryAgain => 'الرجاء المحاولة مرة أُخرى';
}