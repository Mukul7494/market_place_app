import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_place/appwrite.dart';
import 'package:market_place/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  ApiClient.client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('646b99fa9adc06fe2bf1')
      .setSelfSigned(status: true);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
