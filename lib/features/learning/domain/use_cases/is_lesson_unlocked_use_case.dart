import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';

@injectable
final class IsLessonUnlockedUseCase {
  const IsLessonUnlockedUseCase();

  bool call(IsLessonUnlockedUseCaseParam param) {
    final course = param.course;
    final lessons = course.lessons;
    final lessonIndex = lessons.indexWhere(
      (lesson) => lesson.id == param.lessonId,
    );
    if (lessonIndex < 0) return false;
    if (lessonIndex == 0) return true;

    final lessonProgress = param.progressByLessonId[param.lessonId];
    if (lessonProgress != null &&
        (lessonProgress.position > Duration.zero ||
            lessonProgress.isCompleted)) {
      return true;
    }

    final previousLesson = lessons[lessonIndex - 1];
    return param.progressByLessonId[previousLesson.id]?.isCompleted ?? false;
  }
}

final class IsLessonUnlockedUseCaseParam {
  const IsLessonUnlockedUseCaseParam({
    required this.course,
    required this.lessonId,
    required this.progressByLessonId,
  });

  final Course course;
  final String lessonId;
  final Map<String, LessonProgress> progressByLessonId;
}
