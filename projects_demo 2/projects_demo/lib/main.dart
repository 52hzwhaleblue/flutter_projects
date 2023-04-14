import 'screens/product_screen.dart';

import 'screens/detail_screen.dart';

import 'screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// B1: khai bao GoRouter
final GoRouter _router = GoRouter(
  debugLogDiagnostics: false,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          name: 'about',
          path: 'about',
          builder: (BuildContext context, GoRouterState state) {
            final a = state.extra as Map;
            return AboutScreen(name: a['name'],);
          },
        ),
        GoRoute(
          path: 'product',
          builder: (BuildContext context, GoRouterState state) {
            return ProductScreen(idList: state.queryParams['id_list'], sortName: state.queryParams['sortName'],);
          },
        ),
        GoRoute(
          path: 'detail/:id',
          builder: (BuildContext context, GoRouterState state) {
            return DetailScreen(id: state.params['id'],);
          },
        ),
      ]
    ),

  ],
);



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // B2: MaterialApp => MaterialApp.router
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,  // B3: them routerConfig
    );
  }
}
