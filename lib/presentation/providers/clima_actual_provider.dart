import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/presentation/providers/clima_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final climaActualProvider =
    StateNotifierProvider<ClimaActualNotifier, Clima?>((ref) {
  final climaActualPorCiudad =
      ref.watch(climaRepositoryProvider).climaActualPorCiudad;
  return ClimaActualNotifier(climaActualPorCiudad);
});

class ClimaActualNotifier extends StateNotifier<Clima?> {
  final Future<Clima> Function(String) climaActualPorCiudad;

  ClimaActualNotifier(this.climaActualPorCiudad) : super(null);

  Future<bool> onCiudadInput(String ciudad) async {
    try {
      state = await climaActualPorCiudad(ciudad);
      return true;
    } catch (e) {
      return false;
    }
  }
}
