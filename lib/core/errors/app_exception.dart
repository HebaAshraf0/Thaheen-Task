sealed class AppException implements Exception {
  const AppException(this.message, [this.cause]);

  final String message;
  final Object? cause;

  @override
  String toString() => '$runtimeType: $message';
}

final class AssetDataException extends AppException {
  const AssetDataException(super.message, [super.cause]);
}

final class LocalStorageException extends AppException {
  const LocalStorageException(super.message, [super.cause]);
}
