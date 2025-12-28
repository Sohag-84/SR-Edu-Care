import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:sr_edu_care/feature/home/presentation/bloc/course_bloc.dart';
import 'package:sr_edu_care/service_locator.dart';
import 'package:sr_edu_care/services/local_preference_service.dart';
import 'package:sr_edu_care/core/theme/app_theme.dart';
import 'package:sr_edu_care/feature/bottom_navigation/presentation/cubit/bottom_nav_cubit.dart';
import 'package:sr_edu_care/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  LocalPreferenceService.instance.init();

  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => BottomNavCubit()),
            BlocProvider(
              create: (context) => AuthBloc(
                userRegistrationUsecase: sl.call(),
                userLoginUsecase: sl.call(),
              ),
            ),
            BlocProvider(
              create: (context) => CourseBloc(getCourseUsecase: sl.call()),
            ),
          ],
          child: MaterialApp.router(
            title: appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            routerConfig: AppPages.router,
            builder: EasyLoading.init(),
          ),
        );
      },
    );
  }
}
