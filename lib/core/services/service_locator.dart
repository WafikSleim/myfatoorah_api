import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myfatoorah_api/core/constants.dart';
import 'package:myfatoorah_api/payment/data/data_sources/payment_remote_data_source.dart';
import 'package:myfatoorah_api/payment/data/repositories/payment_repository.dart';

final instance = GetIt.instance;

init(String apiToken) {
  instance.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        followRedirects: false,
        validateStatus: (status) {
          return (status ?? 0) < 500;
        },
        headers: {
          "Authorization": "Bearer $apiToken",
        },
      ),
    ),
  );

  instance
      .registerLazySingleton(() => PaymentRemoteDataSource(instance<Dio>()));

  instance.registerLazySingleton(
      () => PaymentRepository(instance<PaymentRemoteDataSource>()));
}