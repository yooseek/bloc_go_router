class CacheException implements Exception {}

class ServerException implements Exception {}

class CustomFirebaseException implements Exception {
  final String error;

  const CustomFirebaseException({
    required this.error,
  });
}
