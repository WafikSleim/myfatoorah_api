import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:myfatoorah_api/core/exception/network_exception.dart';
import 'package:myfatoorah_api/core/services/service_locator.dart';
import 'package:myfatoorah_api/payment/data/repositories/payment_repository.dart';
import 'package:myfatoorah_api/payment/domain/entities/currency_iso.dart';
import 'package:myfatoorah_api/payment/domain/entities/execute_payment_request.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_request.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_response.dart';
import 'package:myfatoorah_api/payment/domain/use_cases/initiate_payment_use_case.dart';

part 'payment_methods_event.dart';
part 'payment_methods_state.dart';

class PaymentMethodsBloc extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  PaymentMethodsBloc() : super(const PaymentMethodsState()) {
    on<InitPaymentEvent>(_initPayment);
    on<ExecutePaymentEvent>(_executePayment);
  }

  static PaymentMethodsBloc get(context) =>BlocProvider.of(context);

  void _initPayment(InitPaymentEvent event, Emitter<PaymentMethodsState> emit) async {
    try {
      emit(
        state.copyWith(
          initState: States.loading,
        ),
      );
      await InitiatePaymentUseCase(instance<PaymentRepository>()).call(InitiatePaymentRequest(invoiceAmount: event.amount, currencyIso: CurrencyIso(title: "", countryIsoCode: "", currencyIsoCode: event.currencyCode, mobileCountry: ""))).then((value) {
        final paymentMethods = value.paymentMethods;
        emit(
          state.copyWith(
            paymentMethods: paymentMethods,
            initState: States.loaded,
          ),
        );
      });
    } on PaymentException catch (e) {
      emit(
        state.copyWith(
          error: e.message,
          initState: States.error,
        ),
      );
      rethrow;
    }
  }

  void _executePayment(ExecutePaymentEvent event, Emitter<PaymentMethodsState> emit) async {
    try {
      emit(state.copyWith(
        executeState: States.loading,
      ));
      final result = await instance<PaymentRepository>().execute(ExecutePaymentRequest(paymentMethodId: event.paymentMethodId, invoiceValue: event.invoiceValue,));
      emit(
        state.copyWith(
          executeState: States.loaded,
        ),
      );
      event.callBack(result.paymentUrl, result.invoiceId, result.isSuccess ?? false);
    } on PaymentException catch (e) {
      emit(
        state.copyWith(
          error: e.message,
          executeState: States.error,
        ),
      );
      rethrow;
    }
  }
}