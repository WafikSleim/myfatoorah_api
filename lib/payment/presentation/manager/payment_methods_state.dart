part of 'payment_methods_bloc.dart';

enum States {
  init,
  loading,
  loaded,
  error,
}


@immutable
class PaymentMethodsState {
  final String? error;
  final States initState;
  final States executeState;
  final List<PaymentMethod> paymentMethods;

  const PaymentMethodsState({
    this.error,
    this.initState = States.init,
    this.executeState = States.init,
    this.paymentMethods = const [],
  });

  PaymentMethodsState copyWith({
    String? error,
    States? initState,
    States? executeState ,
    List<PaymentMethod>? paymentMethods,
  }) {
    return PaymentMethodsState(
      error: error ?? this.error,
      initState: initState ?? this.initState,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      executeState: executeState ?? this.executeState,
    );
  }

  @override
  String toString() {
    return 'PaymentMethodsState{error: $error, initState: $initState, executeState: $executeState, paymentMethods: $paymentMethods}';
  }
}
