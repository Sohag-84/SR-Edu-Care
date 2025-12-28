import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/feature/bottom_navigation/presentation/cubit/bottom_nav_cubit.dart';
import 'package:sr_edu_care/routes/app_routes.dart';

class BottomNavigationView extends StatelessWidget {
  final Widget child;
  const BottomNavigationView({super.key, required this.child});

  int _getIndex(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.home:
        return 0;
      case BottomNavItem.mycourse:
        return 1;
      case BottomNavItem.wishlist:
        return 2;
      case BottomNavItem.profile:
        return 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _getIndex(state.currentItem),
            selectedItemColor: orangeColor,
            selectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
            onTap: (index) {
              final cubit = context.read<BottomNavCubit>();
              switch (index) {
                case 0:
                  cubit.selectItem(BottomNavItem.home);
                  context.go(AppRoutes.home.path);
                  break;

                case 1:
                  cubit.selectItem(BottomNavItem.mycourse);
                  context.go(AppRoutes.myCourse.path);
                  break;

                case 2:
                  cubit.selectItem(BottomNavItem.wishlist);
                  context.go(AppRoutes.wishlist.path);
                  break;

                case 3:
                  cubit.selectItem(BottomNavItem.profile);
                  context.go(AppRoutes.profile.path);
                  break;
                default:
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_stories_outlined),
                label: "My Courses",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star_outline_outlined),
                label: "Wishlist",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
