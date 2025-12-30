import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:sr_edu_care/core/constants/app_assets.dart';
import 'package:sr_edu_care/core/constants/export.dart';

Widget refresh({required VoidCallback onRefresh, required Widget child}) {
  return CustomRefreshIndicator(
    onRefresh: () async {
      onRefresh();
    },
    builder: (context, child, controller) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          if (!controller.isIdle)
            Positioned(
              top: 20.0 * controller.value,
              child: Center(
                child: Image.asset(whiteLogo, height: 60.h, width: 60.w),
              ),
            ),
          Transform.translate(
            offset: Offset(0, 100.0 * controller.value),
            child: child,
          ),
        ],
      );
    },
    child: child,
  );
}
