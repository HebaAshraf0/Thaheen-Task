import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/progress/progress_state.dart';

@LazySingleton()
final class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit() : super(const ProgressState());

  void lessonProgressSaved(LessonProgress progress) {
    emit(ProgressState(latestSavedProgress: progress));
  }
}
