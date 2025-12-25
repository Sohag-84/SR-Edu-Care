import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/core/theme/app_theme.dart';
import 'package:sr_edu_care/feature/bottom_navigation/presentation/cubit/bottom_nav_cubit.dart';
import 'package:sr_edu_care/routes/app_pages.dart';

void main() {
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
          providers: [BlocProvider(create: (context) => BottomNavCubit())],
          child: MaterialApp.router(
            title: appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            routerConfig: AppPages.router,
          ),
        );
      },
    );
  }
}
