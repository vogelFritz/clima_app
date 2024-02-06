import 'package:go_router/go_router.dart';

import 'package:clima_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/resultados',
      builder: (_, __) => const ResultadosScreen(),
    ),
  ],
);
