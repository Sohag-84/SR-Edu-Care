import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sr_edu_care/core/constants/export.dart';

Widget loader({double height = 100}) {
  return Center(
    child: SizedBox(
      height: height,
      child: SpinKitFadingCube(
        color: whiteColor,
        size: 25.h,
      ),
    ),
  );
}