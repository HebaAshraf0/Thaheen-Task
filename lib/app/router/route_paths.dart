abstract final class RoutePaths {
  static const courses = '/';
  static const courseDetails = '/courses/:courseId';
  static const lessonPlayer = '/courses/:courseId/lessons/:lessonId';

  static String courseDetailsLocation(String courseId) => '/courses/$courseId';

  static String lessonPlayerLocation({
    required String courseId,
    required String lessonId,
  }) =>
      '/courses/$courseId/lessons/$lessonId';
}
