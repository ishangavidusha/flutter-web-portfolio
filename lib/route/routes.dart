import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/app.dart';
import '../views/not_found.dart';
import '../views/home/home.dart';
import '../views/splash.dart';
import 'pages.dart';

class AppRouter {
  late final AppService appService;
  AppRouter({
    required this.appService,
  });
  
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: appService,
    initialLocation: Pages.home.toPath(),
    routes: [
      GoRoute(
        path: Pages.home.toPath(),
        name: Pages.home.toPathName(),
        pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const HomePage()),
      ),
      GoRoute(
        path: Pages.splash.toPath(),
        name: Pages.splash.toPathName(),
        pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const SplashPage()),
      ),
    ],
    errorBuilder: (context, state) => NotFoundPage(state: state),
    redirect: (BuildContext context, GoRouterState state) {
      final routerConfiguration = router.routeInformationParser.configuration;
      final homeLocation = routerConfiguration.namedLocation(Pages.home.toPathName());
      final splashLocation = routerConfiguration.namedLocation(Pages.splash.toPathName());

      final isInitialized = appService.initialized;

      final isGoingToInit = state.subloc == splashLocation;

      if (!isInitialized && !isGoingToInit) {
        return splashLocation;
      } else if (isInitialized && isGoingToInit) {
        return homeLocation;
      } else {
        return null;
      }
    }
  );
}
