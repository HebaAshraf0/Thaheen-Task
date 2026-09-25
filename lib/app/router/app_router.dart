import 'package:go_router/go_router.dart';
import 'package:thaheen_task/app/router/route_names.dart';
import 'package:thaheen_task/app/router/route_paths.dart';
import 'package:thaheen_task/features/learning/presentation/screens/course_details_screen.dart';
import 'package:thaheen_task/features/learning/presentation/screens/courses_screen.dart';
import 'package:thaheen_task/features/learning/presentation/screens/lesson_player_screen.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.courses,
    routes: [
      GoRoute(
        path: RoutePaths.courses,
        name: RouteNames.courses,
        builder: (context, state) => const CoursesScreen(),
      ),
      GoRoute(
        path: RoutePaths.courseDetails,
        name: RouteNames.courseDetails,
        builder: (context, state) =>
            CourseDetailsScreen(courseId: state.pathParameters['courseId']!),
      ),
      GoRoute(
        path: RoutePaths.lessonPlayer,
        name: RouteNames.lessonPlayer,
        builder: (context, state) => LessonPlayerScreen(
          courseId: state.pathParameters['courseId']!,
          lessonId: state.pathParameters['lessonId']!,
        ),
      ),
    ],
  );
}
