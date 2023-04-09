import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muscle_training/ui/pages/base_bottom_nav.dart';
import 'package:muscle_training/ui/pages/setting/setting_page.dart';

import '../utiles/bottom_nav_view_type.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return BaseBottomNav(
              firstViewTypeIndex: BottomNavViewType.home.index);
        },
        routes: [
          GoRoute(
            path: 'setting',
            builder: (context, state) {
              return Scaffold(
                body: BaseBottomNav(
                    firstViewTypeIndex: BottomNavViewType.setting.index),
              );
            },
            // これいらない
            routes: [
              GoRoute(
                path: 'page',
                builder: (context, state) {
                  return const SettingPage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
