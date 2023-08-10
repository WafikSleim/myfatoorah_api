import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myfatoorah_api/core/constants.dart';

final instance = GetIt.instance;

init(String apiToken) {
  instance.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: {
          "Authorization": "Bearer $apiToken",
        },
      ),
    ),
  );



}
