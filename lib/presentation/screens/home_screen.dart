import 'package:clima_app/presentation/providers/clima_actual_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('Ingrese una ciudad para obtener el clima actual'),
          TextField(
            onSubmitted: (value) {
              ref.read(climaActualProvider.notifier).onCiudadInput(value);
              context.push('/resultados');
            },
          ),
        ]),
      ),
    );
  }
}
