

class Failure {
  final int? statusCode;
  final String? message;
  final dynamic response;
  Failure({this.statusCode, this.message, this.response});
}

class ServerFailure extends Failure {
  final int? statusCode;
  final String? message;
  final dynamic response;
  ServerFailure({this.statusCode, this.message, this.response});
}

class CacheFailure extends Failure {
  final int? statusCode;
  final String? message;
  CacheFailure({this.statusCode, this.message});
}
