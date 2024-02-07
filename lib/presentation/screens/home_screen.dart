import 'package:clima_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = TextEditingController();
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    final requestStatus = ref.watch(requestStatusProvider);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon: isDarkMode
                ? const Icon(Icons.sunny)
                : const Icon(Icons.mode_night))
      ]),
      body: Center(
        child: SizedBox(
          width: 400,
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 150),
              SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset('assets/icon/weather-icon.png')),
              const Text('Ingrese una ciudad para obtener el clima actual',
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
              CustomTextField(
                textController: textController,
                errorText: requestStatus == RequestStatus.failed
                    ? 'No se pudo encontrar la ciudad'
                    : null,
                hintText: 'London',
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    textController.clear();
                    ref.read(climaActualProvider.notifier).onCiudadInput(value);
                    context.push('/resultados');
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
