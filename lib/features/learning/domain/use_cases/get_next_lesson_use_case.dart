import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';

@injectable
final class GetNextLessonUseCase {
  const GetNextLessonUseCase();

  Lesson? call(GetNextLessonUseCaseParam param) {
    final course = param.course;
    final lessons = course.lessons;
    final currentIndex = lessons.indexWhere(
      (lesson) => lesson.id == param.currentLessonId,
    );
    final nextIndex = currentIndex + 1;
    if (currentIndex < 0 || nextIndex >= lessons.length) return null;

    return lessons[nextIndex];
  }
}

final class GetNextLessonUseCaseParam {
  const GetNextLessonUseCaseParam({
    required this.course,
    required this.currentLessonId,
  });

  final Course course;
  final String currentLessonId;
}
