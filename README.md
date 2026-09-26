# Thaheen Mini Offline LMS

Arabic-first Flutter learning app built for the Thaheen screening task. Course
data and videos are bundled with the app; lesson progress, theme, and language
are stored locally.

## Run

Requirements: Flutter SDK with Dart 3.8 or later, plus an Android emulator,
iOS simulator, or physical device.

```bash
flutter pub get
flutter run
```

Generated files are included in the repository. Regenerate them only after
changing Injectable, Freezed, JSON models, or ARB files:

```bash
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

Useful checks:

```bash
flutter analyze
flutter test
```

## Structure

The project uses feature-first Clean Architecture.

- **Data** — asset and local data sources, models, mappers, and repository implementations.
- **Domain** — entities, repository contracts, and use cases for progress, completion, and lesson unlock rules.
- **Presentation** — screens, reusable widgets, and Cubits.

Cubit keeps UI state separate from business rules. Freezed provides immutable
state unions, and `get_it` with `injectable` manages dependencies. This keeps
the current offline implementation replaceable by API-backed sources later.

## Local persistence

`SharedPreferencesAsync` stores the small amount of mutable data required by
the task: lesson positions/completion, active course, theme, and language. It
is lightweight, survives app restarts, and avoids adding a database for a few
key-value records.

It is not intended as a general LMS database. A production app with downloads,
catalogue search, sync, migrations, or larger progress data should use a local
database such as Drift, Isar, or SQLite.

## Arabic and RTL

Arabic is the default locale; English is available from Settings. Text,
navigation, directional icons, and asymmetric padding follow the current text
direction.

The Chewie media seek bar remains left-to-right in both languages. Media
playback controls represent the direction of the recording, rather than the
reading direction of the page; keeping them LTR matches Material guidance and
preserves the familiar `0:00 → end` interaction.

## Trade-offs and known limits

- Courses and video files are bundled assets. Content changes require a new app build; there is no remote sync, pagination, or download manager.
- Progress is saved on the device only and is not associated with a user account.
- Playback behaviour depends on the platform codecs supported by `video_player` and Chewie.
- Unit tests cover the 90% completion threshold, unlock rules, and course-progress calculation. Widget tests cover lesson status presentation.
