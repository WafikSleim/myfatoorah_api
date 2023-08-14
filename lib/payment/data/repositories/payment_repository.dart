import 'package:myfatoorah_api/payment/data/data_sources/payment_remote_data_source.dart';
import 'package:myfatoorah_api/payment/data/models/execute_payment_request_model.dart';
import 'package:myfatoorah_api/payment/data/models/initiate_payment_request_model.dart';
import 'package:myfatoorah_api/payment/domain/entities/execute_payment_request.dart';
import 'package:myfatoorah_api/payment/domain/entities/execute_payment_response.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_request.dart';
import 'package:myfatoorah_api/payment/domain/entities/initiate_payment_response.dart';
import 'package:myfatoorah_api/payment/domain/repositories/base_payment_repository.dart';

class PaymentRepository extends BasePaymentRepository {
  final BasePaymentRemoteDataSource paymentRemoteDataSource;

  PaymentRepository(this.paymentRemoteDataSource);

  @override
  Future<ExecutePaymentResponse> execute(ExecutePaymentRequest request) async {
    return await paymentRemoteDataSource.execute(ExecutePaymentRequestModel(invoiceValue: request.invoiceValue, paymentMethodId: request.paymentMethodId, callBackUrl: request.callBackUrl, errorUrl: request.errorUrl,));
  }

  @override
  Future<InitiatePaymentResponse> init(InitiatePaymentRequest initiatePaymentRequest) async {
    return await paymentRemoteDataSource.init(InitiatePaymentRequestModel(invoiceAmount: initiatePaymentRequest.invoiceAmount, currencyIso: initiatePaymentRequest.currencyIso,));
  }
}