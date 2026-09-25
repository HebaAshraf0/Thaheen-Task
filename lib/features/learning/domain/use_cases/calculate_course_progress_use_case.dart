import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';

@injectable
final class CalculateCourseProgressUseCase {
  const CalculateCourseProgressUseCase();

  double call(CalculateCourseProgressUseCaseParam param) {
    final course = param.course;
    final progressByLessonId = param.progressByLessonId;
    if (course.lessonCount == 0) return 0;
    final completedLessons = course.lessons.where((lesson) {
      return progressByLessonId[lesson.id]?.isCompleted ?? false;
    }).length;
    return completedLessons / course.lessonCount * 100;
  }
}

final class CalculateCourseProgressUseCaseParam {
  const CalculateCourseProgressUseCaseParam({
    required this.course,
    required this.progressByLessonId,
  });

  final Course course;
  final Map<String, LessonProgress> progressByLessonId;
}
