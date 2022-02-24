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
    initialLocation: APP_PAGES.home.toPath(),
    routes: [
      GoRoute(
        path: APP_PAGES.home.toPath(),
        name: APP_PAGES.home.toPathName(),
        pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const HomePage()),
      ),
      GoRoute(
        path: APP_PAGES.splash.toPath(),
        name: APP_PAGES.splash.toPathName(),
        pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const SplashPage()),
      ),
    ],
    errorBuilder: (context, state) => NotFoundPage(state: state),
    redirect: (GoRouterState state) {
      final homeLocation = state.namedLocation(APP_PAGES.home.toPathName());
      final splashLocation = state.namedLocation(APP_PAGES.splash.toPathName());

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
