import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../constants/config.dart';
import '../../constants/const_message_response.dart';
import 'errors.dart';
import 'loading_interceptors.dart';

class ApiPokemon {
  ApiPokemon._internal();

  static final _singleton = ApiPokemon._internal();

  factory ApiPokemon() => _singleton;

  static Future<Dio> dio({
    bool loading = false,
  }) async {

    var dio = Dio(BaseOptions(
      baseUrl: ConfigFile.apiUrl,
      receiveDataWhenStatusError: true,
    ));

    if (loading) {
      dio.interceptors.addAll({
        LoadingInterceptor(),
      });
    }

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });

    return dio;
  }

  static Result<T, String> handle<T>(
      Response<dynamic> response,
      T Function(dynamic json) fromJson,
      ) {
    try {
      if (response.statusCode != 200) {
        return Error("Error en la petición: ${response.statusCode}");
      }

      final data = response.data;

      if (data == null) {
        return Error("Respuesta vacía del servidor");
      }


      return Success(fromJson(data));
    } catch (e) {
      return const Error(ConstMessageResponse.errorExceptionDioResponse);
    }
  }

}
