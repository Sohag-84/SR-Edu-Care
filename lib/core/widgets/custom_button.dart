import 'package:sr_edu_care/core/constants/export.dart';

GestureDetector customButton({
  required VoidCallback onTap,
  required String btnText,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 45.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: orangeColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        btnText,
        style: TextStyle(
          color: whiteColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
