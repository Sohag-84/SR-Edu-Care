part of 'bottom_nav_cubit.dart';

enum BottomNavItem { home, mycourse, wishlist, profile }

class BottomNavState extends Equatable {
  final BottomNavItem currentItem;
  const BottomNavState({required this.currentItem});

  @override
  List<Object> get props => [currentItem];
}
