class ExecutePaymentRequest {
  final double? invoiceValue;
  final int? paymentMethodId;
  final String? callBackUrl;
  final String? errorUrl;


  const ExecutePaymentRequest({
    this.invoiceValue,
    this.paymentMethodId,
    this.callBackUrl,
    this.errorUrl,
  });
}