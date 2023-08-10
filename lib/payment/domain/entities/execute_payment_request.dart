class ExecutePaymentRequest {
  final double? invoiceValue;
  final int? paymentMethodId;

  const ExecutePaymentRequest({
    this.invoiceValue,
    this.paymentMethodId,
  });
}