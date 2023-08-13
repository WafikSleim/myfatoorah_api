import 'package:flutter/material.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_response.dart';

class PaymentMethodItemWidget extends StatelessWidget {
  const PaymentMethodItemWidget({
    super.key,
    required this.paymentMethod,
    required this.onSelect,
  });

  final PaymentMethod paymentMethod;
  final void Function(int paymentMethodId) onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              paymentMethod.imageUrl ?? "",
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.error,
                  color: Colors.red,
                );
              },
            ),
          ),
          Text(
            paymentMethod.paymentMethodAr ?? "",
          ),
        ],
      ),
    );
  }
}
