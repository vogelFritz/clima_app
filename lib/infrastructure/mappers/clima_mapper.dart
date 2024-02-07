import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/infrastructure/models/open_weather_map_response.dart';

class ClimaMapper {
  static Clima openWeatherMapResponseToClima(OpenWeatherMapResponse response) =>
      Clima(
        ciudad: response.name,
        temp: (response.main.temp - 273).round(),
        sensacionTermica: (response.main.feelsLike - 273).round(),
        humedad: response.main.humidity,
        presion: response.main.pressure,
        visibilidad: (response.visibility / 1000).round(),
        descripcion:
            _capitalizarPrimeraLetra(response.weather.first.description),
        viento: Viento(
            velocidad: response.wind.speed * 3.6,
            direccion: _gradosAPuntoCardinal(response.wind.deg)),
        iconId: response.weather.first.icon,
      );

  static String _gradosAPuntoCardinal(int deg) {
    final aux = (deg / 22.5).floor();
    switch (aux) {
      case 0:
        return 'N';
      case 1:
        return 'NE';
      case 2:
        return 'NE';
      case 3:
        return 'E';
      case 4:
        return 'E';
      case 5:
        return 'SE';
      case 6:
        return 'SE';
      case 7:
        return 'S';
      case 8:
        return 'S';
      case 9:
        return 'SO';
      case 10:
        return 'SO';
      case 11:
        return 'O';
      case 12:
        return 'O';
      case 13:
        return 'NO';
      case 14:
        return 'NO';
      case 15:
        return 'N';
      default:
        return 'XX';
    }
  }

  static String _capitalizarPrimeraLetra(String str) {
    return str.replaceRange(0, 1, str[0].toUpperCase());
  }
}
