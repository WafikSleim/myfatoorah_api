import 'package:dio/dio.dart';
import 'package:myfatoorah_api/core/exception/network_exception.dart';

import '../models/execute_payment_request_model.dart';
import '../models/execute_payment_response_model.dart';
import '../models/initiate_payment_request_model.dart';
import '../models/initiate_payment_response_model.dart';

abstract class BasePaymentRemoteDataSource {
  Future<InitiatePaymentResponseModel> init(InitiatePaymentRequestModel initiatePaymentRequest);

  Future<ExecutePaymentResponseModel> execute(ExecutePaymentRequestModel request);
}

class PaymentRemoteDataSource extends BasePaymentRemoteDataSource {

  final Dio dio;


  PaymentRemoteDataSource(this.dio);

  @override
  Future<ExecutePaymentResponseModel> execute(ExecutePaymentRequestModel request) async {
    try {
      final result = await dio.post("ExecutePayment", data: request.toMap());
      return ExecutePaymentResponseModel.fromMap(result.data);
    } on DioException catch (e) {
      throw PaymentException(message: e.message, code: e.response?.statusCode,);
    }
  }

  @override
  Future<InitiatePaymentResponseModel> init(InitiatePaymentRequestModel initiatePaymentRequest) async {
    try {
      final result = await dio.post("InitiatePayment", data: initiatePaymentRequest.toMap());
      return InitiatePaymentResponseModel.fromMap(result.data);
    } on DioException catch (e) {
      throw PaymentException(message: e.message, code: e.response?.statusCode);
    }
  }

}