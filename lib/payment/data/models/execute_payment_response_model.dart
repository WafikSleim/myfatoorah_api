import 'package:myfatoorah_api/payment/domain/entities/execute_payment_response.dart';

class ExecutePaymentResponseModel extends ExecutePaymentResponse {

  const ExecutePaymentResponseModel({
    super.invoiceId,
    super.paymentUrl,
    super.isSuccess,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExecutePaymentResponseModel &&
          runtimeType == other.runtimeType &&
          invoiceId == other.invoiceId &&
          paymentUrl == other.paymentUrl &&
          isSuccess == other.isSuccess);

  @override
  int get hashCode =>
      invoiceId.hashCode ^ paymentUrl.hashCode ^ isSuccess.hashCode;

  @override
  String toString() {
    return 'ExecutePaymentResponseModel{ invoiceId: $invoiceId, paymentUrl: $paymentUrl, isSuccess: $isSuccess,}';
  }

  ExecutePaymentResponseModel copyWith({
    int? invoiceId,
    String? paymentUrl,
    bool? isSuccess,
  }) {
    return ExecutePaymentResponseModel(
      invoiceId: invoiceId ?? this.invoiceId,
      paymentUrl: paymentUrl ?? this.paymentUrl,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'invoiceId': invoiceId,
      'paymentUrl': paymentUrl,
      'isSuccess': isSuccess,
    };
  }

  factory ExecutePaymentResponseModel.fromMap(Map<String, dynamic> map) {
    return ExecutePaymentResponseModel(
      invoiceId: map["Data"]['InvoiceId'] as int,
      paymentUrl: map["Data"]['PaymentURL'] as String,
      isSuccess: map['isSuccess'] as bool,
    );
  }

}