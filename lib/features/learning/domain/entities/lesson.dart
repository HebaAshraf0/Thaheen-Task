import 'package:equatable/equatable.dart';

final class Lesson extends Equatable {
  const Lesson({
    required this.id,
    required this.title,
    required this.duration,
    required this.videoAssetPath,
  });

  final String id;
  final String title;
  final Duration duration;
  final String videoAssetPath;

  @override
  List<Object?> get props => [id, title, duration, videoAssetPath];
}
