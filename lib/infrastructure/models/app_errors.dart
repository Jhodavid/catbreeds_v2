
class ConnectionError implements Exception {}

class CustomError implements Exception {
  final String message;

  CustomError(this.message);
}