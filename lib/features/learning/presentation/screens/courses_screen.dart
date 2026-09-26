import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thaheen_task/app/di/injection.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/continue_watching/continue_watching_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/courses/courses_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/courses/courses_progress_listener.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/courses/courses_view.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CoursesCubit>()..load()),
        BlocProvider(create: (_) => getIt<ContinueWatchingCubit>()..load()),
      ],
      child: const CoursesProgressListener(child: CoursesView()),
    );
  }
}
