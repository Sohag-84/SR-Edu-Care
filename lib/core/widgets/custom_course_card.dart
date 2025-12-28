import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/core/utils/utils.dart';

class CustomCourseCard extends StatelessWidget {
  final VoidCallback onTap;
  final String thumbnailImage;
  final String title;
  final String courseDuration;
  final String lessonCount;
  final String level;
  final String categroy;
  const CustomCourseCard({
    super.key,
    required this.onTap,
    required this.thumbnailImage,
    required this.title,
    required this.courseDuration,
    required this.lessonCount,
    required this.level,
    required this.categroy,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          color: inputFieldColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            customNetworkImage(image: thumbnailImage),
            Gap(3.h),
            Text(
              categroy,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: greyColor,
              ),
            ),
            Gap(3.h),
            Text.rich(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              TextSpan(
                text: title,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: " $lessonCount",
                    style: TextStyle(fontSize: 11.sp, color: greyColor),
                  ),
                ],
              ),
            ),
            Gap(3.h),
            // course label
            Text.rich(
              TextSpan(
                text: "Level: ",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: " $level",
                    style: TextStyle(fontSize: 11.sp, color: whiteColor),
                  ),
                ],
              ),
            ),

            Gap(3.h),
            Text(
              courseDuration,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
