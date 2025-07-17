class InvalidUuidException implements Exception {
  InvalidUuidException([
    this.message,
  ]);

  final String? message;

  @override
  String toString() {
    if (message == null) {
      return 'InvalidUuidException';
    }
    return 'InvalidUuidException: $message';
  }
}
