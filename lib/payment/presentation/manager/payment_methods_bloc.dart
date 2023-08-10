import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_response.dart';

part 'payment_methods_event.dart';
part 'payment_methods_state.dart';

class PaymentMethodsBloc extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  PaymentMethodsBloc() : super(const PaymentMethodsState()) {

  }

  static PaymentMethodsBloc get(context) =>BlocProvider.of(context);
}
