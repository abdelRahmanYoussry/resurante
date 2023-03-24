class HandleException implements Exception {
  final int statusCode;
  final String? message;

  const HandleException({required this.statusCode, this.message});

  @override
  String toString() {
    return 'KoException: statusCode: $statusCode, message: ${message ?? 'No message specified'}';
  }
}
