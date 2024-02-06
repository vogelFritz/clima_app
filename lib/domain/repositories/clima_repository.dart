import 'package:clima_app/domain/entities/clima.dart';

abstract class ClimaRepository {
  Future<Clima> climaActualPorCiudad(String ciudad);
}
