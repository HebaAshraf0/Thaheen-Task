// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get language => 'Language';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get appTitle => 'Thaheen';

  @override
  String get coursesTitle => 'Courses';

  @override
  String get coursesSubtitle => 'Learn at your own pace, wherever you are';

  @override
  String get courseContent => 'Course content';

  @override
  String get courseDetailsTitle => 'Course details';

  @override
  String get lessonPlayerTitle => 'Lesson player';

  @override
  String get noCourses => 'No courses are currently available';

  @override
  String get noLessons => 'No lessons are available in this course yet';

  @override
  String get courseNotFound => 'This course could not be found';

  @override
  String get loadError => 'The content could not be loaded';

  @override
  String get retry => 'Retry';

  @override
  String lessonsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lessons',
      one: '1 lesson',
      zero: 'No lessons',
    );
    return '$_temp0';
  }

  @override
  String progressPercentage(Object percentage) {
    return '$percentage% complete';
  }

  @override
  String get continueWatching => 'Continue watching';

  @override
  String get notStarted => 'Not started';

  @override
  String get inProgress => 'In progress';

  @override
  String get completed => 'Completed';

  @override
  String get locked => 'Locked';

  @override
  String get lockedLessonMessage =>
      'Complete the previous lesson to unlock this lesson';

  @override
  String get videoUnavailable => 'The video file could not be played';

  @override
  String get playbackSpeed => 'Playback speed';

  @override
  String get subtitles => 'Subtitles';

  @override
  String get cancel => 'Cancel';

  @override
  String get currentLesson => 'Current lesson';

  @override
  String get nextLesson => 'Next lesson';

  @override
  String get screenComingSoon =>
      'This screen structure is ready for implementation';
}
