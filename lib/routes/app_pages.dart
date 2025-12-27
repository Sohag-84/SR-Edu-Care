import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sr_edu_care/feature/authentication/presentation/views/signin_view.dart';
import 'package:sr_edu_care/feature/authentication/presentation/views/signup_view.dart';
import 'package:sr_edu_care/feature/bottom_navigation/presentation/view/bottom_navigation_view.dart';
import 'package:sr_edu_care/feature/home/presentation/view/home_view.dart';
import 'package:sr_edu_care/feature/my_course/presentation/view/my_course_view.dart';
import 'package:sr_edu_care/feature/profile/presentation/view/profile_view.dart';
import 'package:sr_edu_care/feature/splash/presentation/view/splash_view.dart';
import 'package:sr_edu_care/feature/wishlist/presentation/view/wishilist_view.dart';
import 'package:sr_edu_care/routes/app_routes.dart';
import 'package:sr_edu_care/services/local_preference_service.dart';

class AppPages {
  static final router = GoRouter(
    initialLocation: AppRoutes.splash.path,
    redirect: (context, state) {
      final String token = LocalPreferenceService.instance.getToken();

      // Allow splash screen to be accessed without redirection
      if (state.matchedLocation == AppRoutes.splash.path) {
        return null;
      }

      if (token.isEmpty) return AppRoutes.login.path;

      if (JwtDecoder.isExpired(token)) {
        LocalPreferenceService.instance.removeToken();
        return AppRoutes.login.path;
      }
      if (token.isNotEmpty) {
        return AppRoutes.home.path;
      }
      return null;
    },
    routes: [
      // splash Route
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        builder: (context, state) => const SplashView(),
      ),

      // login Route
      GoRoute(
        path: AppRoutes.login.path,
        name: AppRoutes.login.name,
        builder: (context, state) => const SigninView(),
      ),

      // signup Route
      GoRoute(
        path: AppRoutes.register.path,
        name: AppRoutes.register.name,
        builder: (context, state) => const SignupView(),
      ),

      //bottom navigation bar
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return BottomNavigationView(child: child);
        },
        routes: [
          //home
          GoRoute(
            path: AppRoutes.home.path,
            name: AppRoutes.home.name,
            builder: (context, state) => const HomeView(),
          ),

          //my course
          GoRoute(
            path: AppRoutes.myCourse.path,
            name: AppRoutes.myCourse.name,
            builder: (context, state) => const MyCourseView(),
          ),

          //wishlist
          GoRoute(
            path: AppRoutes.wishlist.path,
            name: AppRoutes.wishlist.name,
            builder: (context, state) => const WishilistView(),
          ),

          //profile
          GoRoute(
            path: AppRoutes.profile.path,
            name: AppRoutes.profile.name,
            builder: (context, state) => const ProfileView(),
          ),
        ],
      ),
    ],
  );
}
