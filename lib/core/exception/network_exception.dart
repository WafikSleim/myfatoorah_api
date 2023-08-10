class PaymentException implements Exception {
  final String? message;
  final int? code;

  const PaymentException({
    this.message,
    this.code,
  });
}