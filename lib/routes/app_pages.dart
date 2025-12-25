import 'package:go_router/go_router.dart';
import 'package:udemy_clone/feature/bottom_nav/presentation/view/bottom_nav_view.dart';
import 'package:udemy_clone/feature/splash/presentation/view/splash_view.dart';
import 'package:udemy_clone/routes/app_routes.dart';

class AppPages {
  static final router = GoRouter(
    initialLocation: AppRoutes.splash.path,
    routes: [
      // splash Route
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        builder: (context, state) => const SplashView(),
      ),

      //bottom nav
      GoRoute(
        path: AppRoutes.bottomNav.path,
        name: AppRoutes.bottomNav.name,
        builder: (context, state) => const BottomNavView(),
      ),
    ],
  );
}
