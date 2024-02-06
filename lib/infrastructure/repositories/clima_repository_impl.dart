import 'package:clima_app/domain/datasources/clima_datasource.dart';
import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/domain/repositories/clima_repository.dart';

class ClimaRepositoryImpl extends ClimaRepository {
  final ClimaDatasource datasource;
  ClimaRepositoryImpl(this.datasource);
  @override
  Future<Clima> climaActualPorCiudad(String ciudad) async {
    return await datasource.climaActualPorCiudad(ciudad);
  }
}
