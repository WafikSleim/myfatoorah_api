import 'package:myfatoorah_api/payment/domain/entities/execute_payment_request.dart';
import 'package:myfatoorah_api/payment/domain/entities/execute_payment_response.dart';
import 'package:myfatoorah_api/payment/domain/repositories/base_payment_repository.dart';

class ExecutePaymentUseCase {
  final BasePaymentRepository paymentRepository;

  ExecutePaymentUseCase(this.paymentRepository);

  Future<ExecutePaymentResponse> call(ExecutePaymentRequest request) async {
    return await paymentRepository.execute(request);
  }
}