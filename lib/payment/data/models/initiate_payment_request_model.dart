import 'package:myfatoorah_api/payment/domain/entities/currency_iso.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_request.dart';

class InitiatePaymentRequestModel extends InitiatePaymentRequest  {
  const InitiatePaymentRequestModel({
    required super.invoiceAmount,
    required super.currencyIso,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InitiatePaymentRequestModel &&
          runtimeType == other.runtimeType &&
          invoiceAmount == other.invoiceAmount &&
          currencyIso == other.currencyIso);

  @override
  int get hashCode => invoiceAmount.hashCode ^ currencyIso.hashCode;

  @override
  String toString() {
    return 'InitiatePaymentRequestModel{ invoiceAmount: $invoiceAmount, currencyIso: $currencyIso,}';
  }

  InitiatePaymentRequestModel copyWith({
    double? invoiceAmount,
    CurrencyIso? currencyIso,
  }) {
    return InitiatePaymentRequestModel(
      invoiceAmount: invoiceAmount ?? this.invoiceAmount,
      currencyIso: currencyIso ?? this.currencyIso,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'InvoiceAmount': invoiceAmount,
      'CurrencyIso': currencyIso.currencyIsoCode,
    };
  }

}