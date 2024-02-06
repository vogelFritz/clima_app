import 'package:clima_app/config/constants/environment.dart';
import 'package:clima_app/domain/datasources/clima_datasource.dart';
import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/infrastructure/mappers/clima_mapper.dart';
import 'package:clima_app/infrastructure/models/open_weather_map_response.dart';
import 'package:dio/dio.dart';

class OpenWeatherMapDatasource extends ClimaDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://api.openweathermap.org/data/2.5/weather',
      queryParameters: {
        'appid': Environment.openWeatherMapKey,
        'lang': 'es',
      }));

  @override
  Future<Clima> climaActualPorCiudad(String ciudad) async {
    final response = await dio.get('/', queryParameters: {
      'q': ciudad,
    });
    final openWeatherMapResponse =
        OpenWeatherMapResponse.fromJson(response.data);
    final climaEntity =
        ClimaMapper.openWeatherMapResponseToClima(openWeatherMapResponse);
    return climaEntity;
  }
}
