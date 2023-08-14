import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_response.dart';

class InitiatePaymentResponseModel extends InitiatePaymentResponse {

  const InitiatePaymentResponseModel({
    super.paymentMethods,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InitiatePaymentResponseModel &&
          runtimeType == other.runtimeType &&
          paymentMethods == other.paymentMethods);

  @override
  int get hashCode =>
      paymentMethods.hashCode;

  @override
  String toString() {
    return 'InitiatePaymentResponseModel{ paymentMethods: $paymentMethods,}';
  }

  InitiatePaymentResponseModel copyWith({
    String? paymentMethodId,
    double? totalPayment,
    List<PaymentMethodModel>? paymentMethods,
  }) {
    return InitiatePaymentResponseModel(
      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'paymentMethods': paymentMethods,
    };
  }

  factory InitiatePaymentResponseModel.fromMap(Map<String, dynamic> map) {
    final data = map["Data"];
    return InitiatePaymentResponseModel(
      paymentMethods: (data["PaymentMethods"] as List<dynamic>).map((e) => PaymentMethodModel.fromMap(e)).toList(),
    );
  }

}

class PaymentMethodModel extends PaymentMethod {

  const PaymentMethodModel({
    super.paymentMethodId,
    super.paymentMethodAr,
    super.paymentMethodEn,
    super.paymentMethodCode,
    super.isDirectPayment,
    super.serviceCharge,
    super.totalAmount,
    required super.currencyIso,
    super.imageUrl,
    super.isEmbeddedSupported,
    super.paymentCurrencyIso,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentMethodModel &&
          runtimeType == other.runtimeType &&
          paymentMethodId == other.paymentMethodId &&
          paymentMethodAr == other.paymentMethodAr &&
          paymentMethodEn == other.paymentMethodEn &&
          paymentMethodCode == other.paymentMethodCode &&
          isDirectPayment == other.isDirectPayment &&
          serviceCharge == other.serviceCharge &&
          totalAmount == other.totalAmount &&
          currencyIso == other.currencyIso &&
          imageUrl == other.imageUrl &&
          isEmbeddedSupported == other.isEmbeddedSupported &&
          paymentCurrencyIso == other.paymentCurrencyIso);

  @override
  int get hashCode =>
      paymentMethodId.hashCode ^
      paymentMethodAr.hashCode ^
      paymentMethodEn.hashCode ^
      paymentMethodCode.hashCode ^
      isDirectPayment.hashCode ^
      serviceCharge.hashCode ^
      totalAmount.hashCode ^
      currencyIso.hashCode ^
      imageUrl.hashCode ^
      isEmbeddedSupported.hashCode ^
      paymentCurrencyIso.hashCode;

  @override
  String toString() {
    return 'PaymentMethodModel{ paymentMethodId: $paymentMethodId, paymentMethodAr: $paymentMethodAr, paymentMethodEn: $paymentMethodEn, paymentMethodCode: $paymentMethodCode, isDirectPayment: $isDirectPayment, serviceCharge: $serviceCharge, totalAmount: $totalAmount, currencyIso: $currencyIso, imageUrl: $imageUrl, isEmbeddedSupported: $isEmbeddedSupported, paymentCurrencyIso: $paymentCurrencyIso,}';
  }

  PaymentMethodModel copyWith({
    int? paymentMethodId,
    String? paymentMethodAr,
    String? paymentMethodEn,
    String? paymentMethodCode,
    bool? isDirectPayment,
    double? serviceCharge,
    double? totalAmount,
    String? currencyIso,
    String? imageUrl,
    bool? isEmbeddedSupported,
    String? paymentCurrencyIso,
  }) {
    return PaymentMethodModel(
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      paymentMethodAr: paymentMethodAr ?? this.paymentMethodAr,
      paymentMethodEn: paymentMethodEn ?? this.paymentMethodEn,
      paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      isDirectPayment: isDirectPayment ?? this.isDirectPayment,
      serviceCharge: serviceCharge ?? this.serviceCharge,
      totalAmount: totalAmount ?? this.totalAmount,
      currencyIso: currencyIso ?? this.currencyIso,
      imageUrl: imageUrl ?? this.imageUrl,
      isEmbeddedSupported: isEmbeddedSupported ?? this.isEmbeddedSupported,
      paymentCurrencyIso: paymentCurrencyIso ?? this.paymentCurrencyIso,
    );
  }

  factory PaymentMethodModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodModel(
      paymentMethodId: map['paymentMethodId'] as int?,
      paymentMethodAr: map['paymentMethodAr'] as String?,
      paymentMethodEn: map['paymentMethodEn'] as String?,
      paymentMethodCode: map['paymentMethodCode'] as String?,
      isDirectPayment: map['isDirectPayment'] as bool?,
      serviceCharge: map['serviceCharge'] as double?,
      totalAmount: map['totalAmount'] as double?,
      currencyIso: map['currencyIso'] as String?,
      imageUrl: map['imageUrl'] as String?,
      isEmbeddedSupported: map['isEmbeddedSupported'] as bool?,
      paymentCurrencyIso: map['paymentCurrencyIso'] as String?,
    );
  }

}