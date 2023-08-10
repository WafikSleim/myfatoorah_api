import 'package:myfatoorah_api/payment/domain/entities/currency_iso.dart';

class InitiatePaymentRequest {
  final double invoiceAmount;
  final CurrencyIso currencyIso;

  const InitiatePaymentRequest({
    required this.invoiceAmount,
    required this.currencyIso,
  });
}