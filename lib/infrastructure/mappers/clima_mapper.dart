import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/infrastructure/models/open_weather_map_response.dart';

class ClimaMapper {
  static Clima openWeatherMapResponseToClima(OpenWeatherMapResponse response) =>
      Clima(temp: response.main.temp);
}
