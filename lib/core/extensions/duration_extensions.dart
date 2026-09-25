extension DurationExtensions on Duration {
  String get asPlayerTimestamp {
    final totalSeconds = inSeconds;
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;
    final minuteText = minutes.toString().padLeft(hours > 0 ? 2 : 1, '0');
    final secondText = seconds.toString().padLeft(2, '0');

    if (hours == 0) return '$minuteText:$secondText';
    return '$hours:$minuteText:$secondText';
  }
}
