import 'package:dio/dio.dart';

const accesToken = 'pk.eyJ1Ijoic2ViYXM3NzAiLCJhIjoiY2xhdTMyZDF4MDJscjNvb3ljMjNpMmUxNiJ9.Gdf17Oug_x33gfoM-ueUDQ';
class TrafficInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest

    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'language': 'en',
      'overview': 'simplified',
      'steps': false,
      'access_token': accesToken
    });

    super.onRequest(options, handler);
  }
}
