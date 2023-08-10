import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_request.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_response.dart';
import 'package:myfatoorah_api/payment/domain/repositories/base_payment_repository.dart';

class InitiatePaymentUseCase {
  final BasePaymentRepository paymentRepository;

  InitiatePaymentUseCase(this.paymentRepository);

  Future<InitiatePaymentResponse> call(InitiatePaymentRequest request) async {
    return await paymentRepository.init(request);
  }
}