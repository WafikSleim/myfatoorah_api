import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.black,
              width: 1
          ),
        ),
        padding: const EdgeInsets.all(
          15,
        ),
        alignment: AlignmentDirectional.center,
        child: SvgPicture.asset(
          "assets/icons/payment/${paymentMethod.paymentMethodId}.svg",
          width: 60,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
