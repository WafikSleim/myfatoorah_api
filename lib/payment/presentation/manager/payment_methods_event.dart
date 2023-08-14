part of 'payment_methods_bloc.dart';

@immutable
abstract class PaymentMethodsEvent {
  const PaymentMethodsEvent();
}

class InitPaymentEvent extends PaymentMethodsEvent {
  final double amount;
  final String currencyCode;

  const InitPaymentEvent({
    required this.amount,
    required this.currencyCode,
  });
}

class ExecutePaymentEvent extends PaymentMethodsEvent {
  final int paymentMethodId;

  final double invoiceValue;

  final void Function(String? paymentUrl, int? invoiceId, bool success) callBack;

  const ExecutePaymentEvent({
    required this.paymentMethodId,
    required this.invoiceValue,
    required this.callBack,
  });
}