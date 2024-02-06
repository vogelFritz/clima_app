import 'package:clima_app/infrastructure/datasources/openweathermap_datasource.dart';
import 'package:clima_app/infrastructure/repositories/clima_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final climaRepositoryProvider = StateProvider((_) {
  final datasource = OpenWeatherMapDatasource();
  return ClimaRepositoryImpl(datasource);
});
