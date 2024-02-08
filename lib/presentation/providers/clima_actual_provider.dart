import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/infrastructure/datasources/openweathermap_datasource.dart';
import 'package:clima_app/presentation/providers/clima_repository_provider.dart';
import 'package:clima_app/presentation/providers/request_status_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final climaActualProvider =
    StateNotifierProvider<ClimaActualNotifier, Clima?>((ref) {
  final climaActualPorCiudad =
      ref.watch(climaRepositoryProvider).climaActualPorCiudad;
  return ClimaActualNotifier(ref, climaActualPorCiudad: climaActualPorCiudad);
});

class ClimaActualNotifier extends StateNotifier<Clima?> {
  final StateNotifierProviderRef ref;
  final Future<Clima> Function(String) climaActualPorCiudad;

  ClimaActualNotifier(this.ref, {required this.climaActualPorCiudad})
      : super(null);

  Future<void> onCiudadInput(String ciudad) async {
    try {
      ref
          .read(requestStatusProvider.notifier)
          .update((_) => RequestStatus.inProgress);
      state = await climaActualPorCiudad(ciudad);
      ref
          .read(requestStatusProvider.notifier)
          .update((_) => RequestStatus.success);
    } on ConnectivityException {
      ref
          .read(requestStatusProvider.notifier)
          .update((_) => RequestStatus.noConnection);
    } catch (e) {
      ref
          .read(requestStatusProvider.notifier)
          .update((_) => RequestStatus.failed);
    }
  }

  void update(Clima? Function(Clima? state) callback) {
    state = callback(state);
  }
}
