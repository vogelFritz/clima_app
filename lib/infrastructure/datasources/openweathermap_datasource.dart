import 'package:clima_app/config/constants/environment.dart';
import 'package:clima_app/domain/datasources/clima_datasource.dart';
import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/infrastructure/mappers/clima_mapper.dart';
import 'package:clima_app/infrastructure/models/open_weather_map_response.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class OpenWeatherMapDatasource extends ClimaDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://api.openweathermap.org/data/2.5/weather',
      queryParameters: {
        'appid': Environment.openWeatherMapKey,
        'lang': 'es',
      },
      validateStatus: (statuscode) => true));

  @override
  Future<Clima> climaActualPorCiudad(String ciudad) async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none ||
        connectivity == ConnectivityResult.bluetooth) {
      throw ConnectivityException();
    }
    final response = await dio.get('/', queryParameters: {
      'q': ciudad,
    });
    if (response.statusCode != 200) {
      throw Exception('La búsqueda no tuvo éxito');
    }
    final openWeatherMapResponse =
        OpenWeatherMapResponse.fromJson(response.data);
    final climaEntity =
        ClimaMapper.openWeatherMapResponseToClima(openWeatherMapResponse);
    return climaEntity;
  }
}

class ConnectivityException implements Exception {
  String? cause;
  ConnectivityException([this.cause]);
}
