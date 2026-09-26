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
/// import 'l10n/app_localizations.dart';
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

  /// No description provided for @settings.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get settings;

  /// No description provided for @darkMode.
  ///
  /// In ar, this message translates to:
  /// **'الوضع الداكن'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get language;

  /// No description provided for @arabic.
  ///
  /// In ar, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In ar, this message translates to:
  /// **'الإنجليزية'**
  String get english;

  /// No description provided for @appTitle.
  ///
  /// In ar, this message translates to:
  /// **'ذهين'**
  String get appTitle;

  /// No description provided for @coursesTitle.
  ///
  /// In ar, this message translates to:
  /// **'الدورات'**
  String get coursesTitle;

  /// No description provided for @coursesSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'تعلّم بالسرعة التي تناسبك، أينما كنت'**
  String get coursesSubtitle;

  /// No description provided for @courseContent.
  ///
  /// In ar, this message translates to:
  /// **'محتوى الدورة'**
  String get courseContent;

  /// No description provided for @courseDetailsTitle.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الدورة'**
  String get courseDetailsTitle;

  /// No description provided for @lessonPlayerTitle.
  ///
  /// In ar, this message translates to:
  /// **'مشغل الدرس'**
  String get lessonPlayerTitle;

  /// No description provided for @noCourses.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد دورات متاحة حاليًا'**
  String get noCourses;

  /// No description provided for @noLessons.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد دروس متاحة في هذه الدورة حتى الآن'**
  String get noLessons;

  /// No description provided for @courseNotFound.
  ///
  /// In ar, this message translates to:
  /// **'تعذر العثور على هذه الدورة'**
  String get courseNotFound;

  /// No description provided for @loadError.
  ///
  /// In ar, this message translates to:
  /// **'تعذر تحميل المحتوى'**
  String get loadError;

  /// No description provided for @retry.
  ///
  /// In ar, this message translates to:
  /// **'إعادة المحاولة'**
  String get retry;

  /// No description provided for @lessonsCount.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, =0{لا توجد دروس} =1{درس واحد} =2{درسان} few{{count} دروس} many{{count} درسًا} other{{count} درس}}'**
  String lessonsCount(num count);

  /// No description provided for @progressPercentage.
  ///
  /// In ar, this message translates to:
  /// **'{percentage}% مكتمل'**
  String progressPercentage(Object percentage);

  /// No description provided for @continueWatching.
  ///
  /// In ar, this message translates to:
  /// **'متابعة المشاهدة'**
  String get continueWatching;

  /// No description provided for @notStarted.
  ///
  /// In ar, this message translates to:
  /// **'لم يبدأ'**
  String get notStarted;

  /// No description provided for @inProgress.
  ///
  /// In ar, this message translates to:
  /// **'قيد التقدم'**
  String get inProgress;

  /// No description provided for @completed.
  ///
  /// In ar, this message translates to:
  /// **'مكتمل'**
  String get completed;

  /// No description provided for @locked.
  ///
  /// In ar, this message translates to:
  /// **'مغلق'**
  String get locked;

  /// No description provided for @lockedLessonMessage.
  ///
  /// In ar, this message translates to:
  /// **'أكمل الدرس السابق لفتح هذا الدرس'**
  String get lockedLessonMessage;

  /// No description provided for @videoUnavailable.
  ///
  /// In ar, this message translates to:
  /// **'تعذر تشغيل ملف الفيديو'**
  String get videoUnavailable;

  /// No description provided for @playbackSpeed.
  ///
  /// In ar, this message translates to:
  /// **'سرعة التشغيل'**
  String get playbackSpeed;

  /// No description provided for @subtitles.
  ///
  /// In ar, this message translates to:
  /// **'الترجمة'**
  String get subtitles;

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// No description provided for @currentLesson.
  ///
  /// In ar, this message translates to:
  /// **'الدرس الحالي'**
  String get currentLesson;

  /// No description provided for @nextLesson.
  ///
  /// In ar, this message translates to:
  /// **'الدرس التالي'**
  String get nextLesson;

  /// No description provided for @screenComingSoon.
  ///
  /// In ar, this message translates to:
  /// **'تم تجهيز بنية هذه الشاشة للتنفيذ'**
  String get screenComingSoon;
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
