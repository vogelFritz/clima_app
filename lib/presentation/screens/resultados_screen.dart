import 'package:clima_app/domain/entities/clima.dart';
import 'package:clima_app/presentation/providers/clima_actual_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/views.dart';

class ResultadosScreen extends ConsumerWidget {
  const ResultadosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Clima? clima = ref.watch(climaActualProvider);

    return clima != null ? ResultadosView(clima: clima) : const LoadingView();
  }
}
