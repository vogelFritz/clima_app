import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:clima_app/presentation/providers/request_status_provider.dart';

class LoadingView extends ConsumerWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(requestStatusProvider, (_, next) {
      if (next == RequestStatus.failed || next == RequestStatus.noConnection) {
        context.pop();
      }
    });
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Espere por favor...', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
