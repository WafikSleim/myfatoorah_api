class InitiatePaymentResponse {
  final List<PaymentMethod>? paymentMethods;


  const InitiatePaymentResponse({
    this.paymentMethods,
  });
}


class PaymentMethod {
  final int? paymentMethodId;
  final String? paymentMethodAr;
  final String? paymentMethodEn;
  final String? paymentMethodCode;
  final bool? isDirectPayment;
  final double? serviceCharge;
  final double? totalAmount;
  final String? currencyIso;
  final String? imageUrl;
  final bool? isEmbeddedSupported;
  final String? paymentCurrencyIso;

  const PaymentMethod({
    this.paymentMethodId,
    this.paymentMethodAr,
    this.paymentMethodEn,
    this.paymentMethodCode,
    this.isDirectPayment,
    this.serviceCharge,
    this.totalAmount,
    this.currencyIso,
    this.imageUrl,
    this.isEmbeddedSupported,
    this.paymentCurrencyIso,
  });
}