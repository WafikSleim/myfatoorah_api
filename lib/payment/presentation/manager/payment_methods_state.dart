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
  final States state;
  final List<PaymentMethod> paymentMethods;

  const PaymentMethodsState({
    this.error,
    this.state = States.init,
    this.paymentMethods = const [],
  });

  PaymentMethodsState copyWith({
    String? error,
    States? state,
    List<PaymentMethod>? paymentMethods,
  }) {
    return PaymentMethodsState(
      error: error ?? this.error,
      state: state ?? this.state,
      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }

  @override
  String toString() {
    return 'PaymentMethodsState{error: $error, state: $state, paymentMethods: $paymentMethods}';
  }
}
