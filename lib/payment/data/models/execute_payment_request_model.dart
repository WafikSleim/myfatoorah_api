import 'package:myfatoorah_api/payment/domain/entities/execute_payment_request.dart';

class ExecutePaymentRequestModel extends ExecutePaymentRequest {

  const ExecutePaymentRequestModel({
    super.invoiceValue,
    super.paymentMethodId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExecutePaymentRequestModel &&
          runtimeType == other.runtimeType &&
          invoiceValue == other.invoiceValue &&
          paymentMethodId == other.paymentMethodId);

  @override
  int get hashCode => invoiceValue.hashCode ^ paymentMethodId.hashCode;

  @override
  String toString() {
    return 'ExecutePaymentRequestModel{ invoiceValue: $invoiceValue, paymentMethodId: $paymentMethodId,}';
  }

  ExecutePaymentRequestModel copyWith({
    double? invoiceValue,
    int? paymentMethodId,
  }) {
    return ExecutePaymentRequestModel(
      invoiceValue: invoiceValue ?? this.invoiceValue,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'InvoiceValue': invoiceValue,
      'PaymentMethodId': paymentMethodId,
    };
  }

  factory ExecutePaymentRequestModel.fromMap(Map<String, dynamic> map) {
    return ExecutePaymentRequestModel(
      invoiceValue: map['invoiceValue'] as double,
      paymentMethodId: map['paymentMethodId'] as int,
    );
  }

}