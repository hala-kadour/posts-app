class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class NetworkException implements Exception {
  final String message;
  NetworkException({required this.message});
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException({required this.message});
}

class EmptyCacheException implements Exception {
  final String message;
  EmptyCacheException({required this.message});
}
