

class ServerException implements Exception {
  final String message;
  final int statusCode;
  final dynamic response;

  ServerException(this.message, this.statusCode, this.response);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class PlatformException implements Exception {
  final String message;
  final int statusCode;

  PlatformException(this.message, this.statusCode);
}
