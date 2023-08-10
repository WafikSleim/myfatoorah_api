class ExecutePaymentResponse {
  final int? invoiceId;
  final String? paymentUrl;
  final bool? isSuccess;

  const ExecutePaymentResponse({
    this.invoiceId,
    this.paymentUrl,
    this.isSuccess,
  });
}