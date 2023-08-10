import 'package:myfatoorah_api/payment/domain/entities/execute_payment_request.dart';
import 'package:myfatoorah_api/payment/domain/entities/execute_payment_response.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_request.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_response.dart';

abstract class BasePaymentRepository {
  Future<InitiatePaymentResponse> init(InitiatePaymentRequest initiatePaymentRequest);

  Future<ExecutePaymentResponse> execute(ExecutePaymentRequest request);
}