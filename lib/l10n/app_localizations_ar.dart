// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get settings => 'الإعدادات';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get language => 'اللغة';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get appTitle => 'ذهين';

  @override
  String get coursesTitle => 'الدورات';

  @override
  String get coursesSubtitle => 'تعلّم بالسرعة التي تناسبك، أينما كنت';

  @override
  String get courseContent => 'محتوى الدورة';

  @override
  String get courseDetailsTitle => 'تفاصيل الدورة';

  @override
  String get lessonPlayerTitle => 'مشغل الدرس';

  @override
  String get noCourses => 'لا توجد دورات متاحة حاليًا';

  @override
  String get courseNotFound => 'تعذر العثور على هذه الدورة';

  @override
  String get loadError => 'تعذر تحميل المحتوى';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String lessonsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count درس',
      many: '$count درسًا',
      few: '$count دروس',
      two: 'درسان',
      one: 'درس واحد',
      zero: 'لا توجد دروس',
    );
    return '$_temp0';
  }

  @override
  String progressPercentage(Object percentage) {
    return '$percentage% مكتمل';
  }

  @override
  String get continueWatching => 'متابعة المشاهدة';

  @override
  String get notStarted => 'لم يبدأ';

  @override
  String get inProgress => 'قيد التقدم';

  @override
  String get completed => 'مكتمل';

  @override
  String get lockedLessonMessage => 'أكمل الدرس السابق لفتح هذا الدرس';

  @override
  String get videoUnavailable => 'تعذر تشغيل ملف الفيديو';

  @override
  String get screenComingSoon => 'تم تجهيز بنية هذه الشاشة للتنفيذ';
}
