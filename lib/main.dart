import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'location_screen.dart';
import 'station_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => LocationScreen()),
      GoRoute(
        path: '/station/:name',
        builder:
            (context, state) =>
                StationScreen(stationName: state.pathParameters['name']!),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
