import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:thaheen_task/features/learning/domain/use_cases/get_courses_use_case.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/courses/courses_state.dart';

@injectable
final class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(this._getCourses) : super(const CoursesInitial());

  final GetCoursesUseCase _getCourses;

  Future<void> load() async {
    emit(const CoursesLoading());
    final result = await _getCourses();
    result.fold((failure) => emit(CoursesError(failure.message)), (courses) {
      emit(courses.isEmpty ? const CoursesEmpty() : CoursesLoaded(courses));
    });
  }
}
