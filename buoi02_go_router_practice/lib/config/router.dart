import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../screens/CategoryScreen.dart';
import '../screens/ProductListScreen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const CategoryScreen();
      },
      // routes: [
      //   GoRoute(
      //     path: 'product_list/:category',
      //     name: 'product_list',
      //     builder: (BuildContext context, GoRouterState state) {
      //       return ProductListScreen(
      //         category: state.params['category']!,
      //         asc: state.queryParams['sort'] == 'asc',
      //         quantity: int.parse(state.queryParams['filter'] ?? '0'),
      //       );
      //     },
      //   ),
      // ],
    ),
    GoRoute(
      path: '/product_list/:category',
      name: 'product_list',
      builder: (BuildContext context, GoRouterState state) {
        return ProductListScreen(
          category: state.params['category']!,
          asc: state.queryParams['sort'] == 'asc',
          quantity: int.parse(state.queryParams['filter'] ?? '0'),
        );
      },
    ),
  ],
);
