import 'package:clima_app/domain/entities/clima.dart';

abstract class ClimaDatasource {
  Future<Clima> climaActualPorCiudad(String ciudad);
}
