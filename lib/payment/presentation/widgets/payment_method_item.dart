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
    return InkWell(
      onTap: () {
        onSelect.call(paymentMethod.paymentMethodId ?? -1);
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  paymentMethod.imageUrl ?? "",
                  height: 80,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                    );
                  },
                ),
                Text(
                  paymentMethod.paymentMethodAr ?? paymentMethod.paymentMethodEn ?? "",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Amount",
                    ),
                    Text(
                      paymentMethod.totalAmount?.toString() ?? "",
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      "service charge"
                    ),
                    Text(
                      paymentMethod.serviceCharge?.toString() ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
