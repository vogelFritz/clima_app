import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:clima_app/infrastructure/models/open_weather_map_response.dart';
import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/infrastructure/mappers/clima_mapper.dart';

void main() {
  const jsonData =
      '{"coord":{"lon":-57.5575,"lat":-38.0023},"weather":[{"id":501,"main":"Rain","description":"lluvia moderada","icon":"10d"}],"base":"stations","main":{"temp":294.68,"feels_like":295.11,"temp_min":294.19,"temp_max":296.22,"pressure":1014,"humidity":85},"visibility":10000,"wind":{"speed":3.13,"deg":60,"gust":4.47},"rain":{"1h":3.47},"clouds":{"all":100},"dt":1707409013,"sys":{"type":2,"id":2073060,"country":"AR","sunrise":1707383473,"sunset":1707433059},"timezone":-10800,"id":3430863,"name":"Mar del Plata","cod":200}';
  group('función _gradosAPuntoCardinal --> ', () {
    test('Con 0ºC devuelve N', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 0;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'N');
    });
    test('Con 23ºC devuelve NE', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 23;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'NE');
    });
    test('Con 45ºC devuelve NE', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 45;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'NE');
    });
    test('Con 68ºC devuelve E', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 68;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'E');
    });
    test('Con 113ºC devuelve SE', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 113;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'SE');
    });
    test('Con 158ºC devuelve S', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 158;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'S');
    });
    test('Con 203ºC devuelve SO', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 203;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'SO');
    });
    test('Con 248ºC devuelve O', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 248;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'O');
    });
    test('Con 293ºC devuelve NO', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 293;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'NO');
    });
    test('Con 338ºC devuelve N', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 338;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'N');
    });
    test('Con 359ºC devuelve N', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 359;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'N');
    });
    test('Con 360ºC devuelve XX', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 360;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'XX');
    });
    test('Con 390ºC devuelve XX', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['wind']['deg'] = 390;

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);
      expect(clima.viento.direccion, 'XX');
    });
  });

  group('función _capitalizarPrimeraLetra --> ', () {
    test('string vacío', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['weather'].first['description'] = '';

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);

      expect(clima.descripcion, '');
    });

    test('una letra', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['weather'].first['description'] = 'o';

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);

      expect(clima.descripcion, 'O');
    });

    test('todo en mayúsculas', () {
      final jsonMap = jsonDecode(jsonData);
      jsonMap['weather'].first['description'] = 'NUBLADO';

      final response = OpenWeatherMapResponse.fromJson(jsonMap);

      final Clima clima = ClimaMapper.openWeatherMapResponseToClima(response);

      expect(clima.descripcion, 'NUBLADO');
    });
  });
}
