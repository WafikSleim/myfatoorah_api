import 'package:flutter/material.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_response.dart';

class PaymentMethodItemWidget extends StatelessWidget {
  const PaymentMethodItemWidget({super.key, required this.paymentMethod, required this.onSelect});

  final PaymentMethod paymentMethod;
  final void Function(int paymentMethodId) onSelect;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.red,
    );
  }
}
