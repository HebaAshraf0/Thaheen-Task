import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/continue_watching_lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';

@injectable
final class GetContinueWatchingUseCase {
  const GetContinueWatchingUseCase();

  ContinueWatchingLesson? call(GetContinueWatchingUseCaseParam param) {
    final course = param.course;
    final hasCourseActivity = param.progressByLessonId.values.any(
      (progress) => progress.courseId == course.id,
    );
    if (!hasCourseActivity) return null;

    for (final lesson in course.lessons) {
      final savedProgress = param.progressByLessonId[lesson.id];
      if (savedProgress?.isCompleted ?? false) continue;

      return ContinueWatchingLesson(
        course: course,
        lesson: lesson,
        progress:
            savedProgress ??
            LessonProgress.notStarted(
              courseId: course.id,
              lessonId: lesson.id,
              duration: lesson.duration,
            ),
      );
    }

    return null;
  }
}

final class GetContinueWatchingUseCaseParam {
  const GetContinueWatchingUseCaseParam({
    required this.course,
    required this.progressByLessonId,
  });

  final Course course;
  final Map<String, LessonProgress> progressByLessonId;
}
