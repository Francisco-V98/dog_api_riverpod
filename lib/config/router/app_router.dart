import 'package:dog_api_riverpod/presentation/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/dogsList',
      builder: (context, state) => const DogsListScreen(),
    ),
    GoRoute(
      path: '/randomImage',
      builder: (context, state) => const RandomImageScreen(),
    ),
  ]);
});
