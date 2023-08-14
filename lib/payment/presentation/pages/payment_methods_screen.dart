import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfatoorah_api/payment/presentation/manager/payment_methods_bloc.dart';
import 'package:myfatoorah_api/payment/presentation/widgets/payment_method_item.dart';

class MyfatoorahAPIPaymentMethodsScreen extends StatelessWidget {
  const MyfatoorahAPIPaymentMethodsScreen({
    super.key,
    this.appBarBackgroundColor,
    this.title,
    required this.amount,
    required this.currencyCode,
    required this.onGenerateUrl, this.leadingColor, required this.callBackUrl, required this.errorUrl,
  });

  final Color? appBarBackgroundColor;
  final Color? leadingColor;
  final String callBackUrl;
  final String errorUrl;

  final Widget? title;

  final double amount;
  final String currencyCode;

  final void Function(String? paymentUrl, int? invoiceId, bool isSuccess) onGenerateUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentMethodsBloc()
        ..add(
          InitPaymentEvent(
            amount: amount,
            currencyCode: currencyCode,
          ),
        ),
      child: BlocConsumer<PaymentMethodsBloc, PaymentMethodsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: appBarBackgroundColor,
              title: title ??
                  const Text(
                    "Myfatoorah",
                  ),
              centerTitle: true,
              iconTheme: Theme.of(context).appBarTheme.iconTheme!.copyWith(
                color: leadingColor,
              ),
            ),
            body: state.initState == States.loaded
                ? ListView(
                    children: state.paymentMethods
                        .map(
                          (e) => PaymentMethodItemWidget(
                            paymentMethod: e,
                            onSelect: (id) {
                              PaymentMethodsBloc.get(context).add(ExecutePaymentEvent(paymentMethodId: id, invoiceValue: amount, callBack: onGenerateUrl,  errorUrl: errorUrl, callBackUrl: callBackUrl,),);
                            },
                          ),
                        )
                        .toList(),
                  )
                : state.initState == States.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Center(
                        child: Icon(Icons.error),
                      ),
          );
        },
      ),
    );
  }
}