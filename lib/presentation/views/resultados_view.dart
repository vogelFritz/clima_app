import 'package:clima_app/domain/entities/clima.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultadosView extends ConsumerWidget {
  final Clima clima;
  const ResultadosView({super.key, required this.clima});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: const TextField()),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(clima.ciudad, style: const TextStyle(fontSize: 40)),
            SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.6,
              child: Stack(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      width: 200,
                      height: 150,
                      margin: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.cloud),
                              Column(
                                mainAxisSize: MainAxisSize.min,
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
                )
              ]),
            ),
          ]),
        ));
  }
}
