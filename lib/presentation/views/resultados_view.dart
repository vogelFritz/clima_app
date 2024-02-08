import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../widgets/widgets.dart';

class ResultadosView extends ConsumerWidget {
  final Clima clima;
  const ResultadosView({super.key, required this.clima});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestStatus = ref.watch(requestStatusProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    final textController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
              ref.read(climaActualProvider.notifier).update((_) => null);
            },
            icon: const Icon(Icons.home),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: CustomTextField(
            textController: textController,
            onSubmitted: (value) {
              textController.clear();
              ref.read(climaActualProvider.notifier).onCiudadInput(value);
            },
            hintText: requestStatus == RequestStatus.failed
                ? 'No se encontró la ciudad'
                : 'Buscar otra ciudad',
            hintStyle: TextStyle(
                color:
                    requestStatus == RequestStatus.failed ? Colors.red : null),
          ),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
              icon: isDarkMode
                  ? const Icon(Icons.sunny)
                  : const Icon(Icons.mode_night),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: requestStatus == RequestStatus.inProgress
                ? const CircularProgressIndicator()
                : _DatosCiudad(clima: clima, size: size),
          ),
        ));
  }
}

class _DatosCiudad extends StatelessWidget {
  final Clima clima;
  final Size size;

  const _DatosCiudad({
    required this.clima,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(clima.ciudad, style: const TextStyle(fontSize: 40)),
      SizedBox(
        width: size.width * 0.9,
        height: size.height * 0.6,
        child: Column(children: [
          const SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                  'https://openweathermap.org/img/wn/${clima.iconId}@2x.png'),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${clima.temp.toString()}ºC',
                    style: const TextStyle(fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Sensación ${clima.sensacionTermica.toString()}ºC',
                    style: const TextStyle(fontSize: 17),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
          Text(clima.descripcion, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 30),
          const Text('Viento',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text(
              '${NumberFormat.decimalPatternDigits(locale: 'es', decimalDigits: 2).format(clima.viento.velocidad).toString()} km/h',
              style: const TextStyle(
                fontSize: 20,
              )),
          Text('Dirección ${clima.viento.direccion}',
              style: const TextStyle(
                fontSize: 20,
              )),
          const SizedBox(height: 30),
          const Text('Humedad',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text('${clima.humedad.toString()}%',
              style: const TextStyle(
                fontSize: 20,
              )),
          const Text('Presión',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text('${clima.presion.toString()} mb',
              style: const TextStyle(
                fontSize: 20,
              )),
          const Text('Visibilidad',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text('${clima.visibilidad.toString()} km',
              style: const TextStyle(
                fontSize: 20,
              )),
        ]),
      ),
    ]);
  }
}
