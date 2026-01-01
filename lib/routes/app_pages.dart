import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sr_edu_care/core/cloudinary/video_upload.dart';
import 'package:sr_edu_care/feature/authentication/presentation/views/signin_view.dart';
import 'package:sr_edu_care/feature/authentication/presentation/views/signup_view.dart';
import 'package:sr_edu_care/feature/bottom_navigation/presentation/view/bottom_navigation_view.dart';
import 'package:sr_edu_care/feature/course/presentation/views/course_view.dart';
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
      final token = LocalPreferenceService.instance.getToken();
      final isLoggedIn = token.isNotEmpty && !JwtDecoder.isExpired(token);

      final isAuthRoute =
          state.matchedLocation == AppRoutes.login.path ||
          state.matchedLocation == AppRoutes.register.path ||
          state.matchedLocation == AppRoutes.splash.path;

      // User not logged in → block protected routes
      if (!isLoggedIn && !isAuthRoute) {
        return AppRoutes.login.path;
      }

      // User logged in → prevent going back to login/register
      if (isLoggedIn && isAuthRoute) {
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

          //course
          GoRoute(
            path: AppRoutes.course.path,
            name: AppRoutes.course.name,
            builder: (context, state) => CourseView(
              courseId: (state.extra as Map)["courseId"].toString(),
            ),
          ),
        ],
      ),

      // video upload
      GoRoute(
        path: AppRoutes.videoUpload.path,
        name: AppRoutes.videoUpload.name,
        builder: (context, state) => VideoUploadPage(
          lectureId: (state.extra as Map)["lectureId"].toString(),
          videoTitle: (state.extra as Map)["videoTitle"].toString(),
          isPreview: (state.extra as Map)["isPreview"] as bool,
          videoUrl: (state.extra as Map)["videoUrl"].toString(),
        ),
      ),
    ],
  );
}
