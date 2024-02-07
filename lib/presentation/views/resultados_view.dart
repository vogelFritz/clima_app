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
    final textController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
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
              onPressed: () {},
              icon: const Icon(Icons.mode_night),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: _DatosCiudad(clima: clima, size: size),
          ),
        ));
  }
}

class _DatosCiudad extends StatefulWidget {
  final Clima clima;
  final Size size;

  const _DatosCiudad({
    required this.clima,
    required this.size,
  });

  @override
  State<_DatosCiudad> createState() => _DatosCiudadState();
}

class _DatosCiudadState extends State<_DatosCiudad> {
  Unidades unidadesViento = Unidades.kmh;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.clima.ciudad, style: const TextStyle(fontSize: 40)),
      SizedBox(
        width: widget.size.width * 0.9,
        height: widget.size.height * 0.6,
        child: Column(children: [
          const SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                  'https://openweathermap.org/img/wn/${widget.clima.iconId}@2x.png'),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.clima.temp.toString()}ºC',
                    style: const TextStyle(fontSize: 22),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Sensación ${widget.clima.sensacionTermica.toString()}ºC',
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
          Text(widget.clima.descripcion, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 30),
          const Text('Viento',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  '${NumberFormat.decimalPatternDigits(locale: 'es', decimalDigits: 2).format(widget.clima.viento.velocidad).toString()} km/h',
                  style: const TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
          Text('Dirección ${widget.clima.viento.direccion}',
              style: const TextStyle(
                fontSize: 20,
              )),
          const SizedBox(height: 30),
          const Text('Humedad',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text('${widget.clima.humedad.toString()}%',
              style: const TextStyle(
                fontSize: 20,
              )),
          const Text('Presión',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text('${widget.clima.presion.toString()} mb',
              style: const TextStyle(
                fontSize: 20,
              )),
          const Text('Visibilidad',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text('${widget.clima.visibilidad.toString()} km',
              style: const TextStyle(
                fontSize: 20,
              )),
        ]),
      ),
    ]);
  }
}

enum Unidades { ms, kmh }
