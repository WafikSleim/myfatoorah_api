import 'package:myfatoorah_api/payment/domain/entities/execute_payment_request.dart';

class ExecutePaymentRequestModel extends ExecutePaymentRequest {

  const ExecutePaymentRequestModel({
    super.invoiceValue,
    super.paymentMethodId,
    super.callBackUrl,
    super.errorUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExecutePaymentRequestModel &&
          runtimeType == other.runtimeType &&
          invoiceValue == other.invoiceValue &&
          callBackUrl == other.callBackUrl &&
          errorUrl == other.errorUrl &&
          paymentMethodId == other.paymentMethodId);

  @override
  int get hashCode => invoiceValue.hashCode ^ paymentMethodId.hashCode;


  ExecutePaymentRequestModel copyWith({
    double? invoiceValue,
    int? paymentMethodId,
    String? callBackUrl,
    String? errorUrl,
  }) {
    return ExecutePaymentRequestModel(
      invoiceValue: invoiceValue ?? this.invoiceValue,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      callBackUrl: callBackUrl ?? this.callBackUrl,
      errorUrl: errorUrl ?? this.errorUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'InvoiceValue': invoiceValue,
      'PaymentMethodId': paymentMethodId,
      'CallBackUrl' : callBackUrl,
      'ErrorUrl' : errorUrl,
    };
  }

}