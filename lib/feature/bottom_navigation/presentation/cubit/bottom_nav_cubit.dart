import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState(currentItem: BottomNavItem.home));

  void selectItem(BottomNavItem item) {
    emit(BottomNavState(currentItem: item));
  }
}
