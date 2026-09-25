# Thaheen Mini Offline LMS

An Arabic-first Flutter learning application built as a screening task. Course
content is loaded from bundled JSON assets and lesson progress is saved locally.

## Bootstrap commands

```sh
flutter pub get
dart run build_runner build
flutter gen-l10n
flutter test
flutter analyze
```

The project follows feature-first Clean Architecture with data, domain, and
presentation layers. Cubit handles presentation state, while GetIt and
Injectable provide dependency injection.

The final architecture decisions, trade-offs, known issues, time spent, and
run instructions will be documented here as implementation progresses.
