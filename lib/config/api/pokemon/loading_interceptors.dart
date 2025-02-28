import 'package:dio/dio.dart';

import '../../services/service_navigation.dart';

class LoadingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Mostrar indicador de carga aquí
    // EasyLoading.show();
    ServiceNavigation.showLoading();
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Ocultar indicador de carga aquí
    // EasyLoading.dismiss();
    ServiceNavigation.goBack();
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Ocultar indicador de carga aquí en caso de error
    // EasyLoading.dismiss();
    ServiceNavigation.goBack();
    super.onError(err, handler);
  }
}
