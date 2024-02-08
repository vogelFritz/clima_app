import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/infrastructure/datasources/openweathermap_datasource.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO: use mock package
  setUpAll(() async {
    await dotenv.load(fileName: '.env');
  });
  test('successful request', () async {
    final openWeatherMapDatasource = OpenWeatherMapDatasource();
    expect(await openWeatherMapDatasource.climaActualPorCiudad('London'),
        isA<Clima>());
  });
  test('nonsense request', () async {
    final openWeatherMapDatasource = OpenWeatherMapDatasource();
    expect(await openWeatherMapDatasource.climaActualPorCiudad('fewuhfew'),
        throwsException);
  });
}
