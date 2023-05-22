import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:market_place/pages/home_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      // GoRoute(
      //   path: '/about',
      //   pageBuilder: (context, state) => const AboutPage(),
      // ),
      // GoRoute(
      //   path: '/settings',
      //   pageBuilder: (context, state) => const SettingsPage(),
      // ),
    ],
  );
});
