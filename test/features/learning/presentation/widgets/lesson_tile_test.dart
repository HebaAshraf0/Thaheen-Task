import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thaheen_task/app/theme/app_screen_config.dart';
import 'package:thaheen_task/app/theme/app_theme.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_status.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/lesson_tile.dart';
import 'package:thaheen_task/l10n/app_localizations.dart';

void main() {
  const lesson = Lesson(
    id: 'lesson-1',
    title: 'Introduction to Anatomy',
    duration: Duration(minutes: 1, seconds: 30),
    videoAssetPath: 'lesson.mp4',
  );

  testWidgets('renders a not-started lesson with its metadata', (tester) async {
    await _pumpLessonTile(
      tester,
      lesson: lesson,
      status: LessonStatus.notStarted,
      isLocked: false,
    );

    expect(find.text(lesson.title), findsOneWidget);
    expect(find.text('1:30'), findsOneWidget);
    expect(find.text('Not started'), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
  });

  testWidgets('renders a locked lesson and prevents interaction', (
    tester,
  ) async {
    var tapCount = 0;
    await _pumpLessonTile(
      tester,
      lesson: lesson,
      status: LessonStatus.inProgress,
      isLocked: true,
      onTap: () => tapCount++,
    );

    expect(find.text('Locked'), findsOneWidget);
    expect(find.byIcon(Icons.lock_outline_rounded), findsOneWidget);

    await tester.tap(find.text(lesson.title));
    await tester.pump();
    expect(tapCount, 0);
  });

  testWidgets('renders a completed lesson and handles interaction', (
    tester,
  ) async {
    var tapCount = 0;
    await _pumpLessonTile(
      tester,
      lesson: lesson,
      status: LessonStatus.completed,
      isLocked: false,
      onTap: () => tapCount++,
    );

    expect(find.text('Completed'), findsOneWidget);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);

    await tester.tap(find.text(lesson.title));
    await tester.pump();
    expect(tapCount, 1);
  });
}

Future<void> _pumpLessonTile(
  WidgetTester tester, {
  required Lesson lesson,
  required LessonStatus status,
  required bool isLocked,
  VoidCallback? onTap,
}) async {
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: AppScreenConfig.designSize,
      minTextAdapt: true,
      builder: (_, _) => MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: LessonTile(
            lesson: lesson,
            status: status,
            isLocked: isLocked,
            onTap: onTap ?? () {},
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}
