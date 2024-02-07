import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/presentation/providers/clima_actual_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class ResultadosView extends ConsumerWidget {
  final Clima clima;
  const ResultadosView({super.key, required this.clima});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            hintText: 'Buscar otra ciudad',
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
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(clima.ciudad, style: const TextStyle(fontSize: 40)),
              SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.6,
                child: Column(children: [
                  Container(
                      width: 200,
                      height: 150,
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(
                                      'https://openweathermap.org/img/wn/${clima.iconId}@2x.png')),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${clima.temp.toString()}ºC',
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'Sensación ${clima.sensacionTermica.toString()}ºC',
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(clima.descripcion),
                        ],
                      )),
                  Container(
                      width: 200,
                      height: 150,
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          const Text('Viento'),
                          Text('${clima.viento.velocidad.toString()} km/h'),
                          Text('Dirección ${clima.viento.direccion}'),
                        ],
                      )),
                ]),
              ),
            ]),
          ),
        ));
  }
}
