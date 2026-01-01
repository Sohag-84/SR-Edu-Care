import 'package:go_router/go_router.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/feature/course/domain/entities/course_section_entity.dart';
import 'package:sr_edu_care/routes/app_routes.dart';
import 'package:sr_edu_care/services/local_preference_service.dart';

Widget lectureSection({
  required LectureEntity lecture,
  required BuildContext context,
  required VoidCallback onVideoPlayTap,
}) {
  return ListTile(
    onTap: onVideoPlayTap,
    leading: Icon(
      lecture.isPreview ? Icons.play_circle_outline : Icons.lock_outline,
      size: 20.sp,
    ),
    title: Text(
      lecture.title,
      maxLines: 2,
      style: TextStyle(
        color: greyColor,
        fontSize: 13.sp,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    trailing: LocalPreferenceService.instance.getUserRole() == "student"
        ? Text("10:00", style: TextStyle(fontSize: 12.sp))
        : GestureDetector(
            onTap: () {
              context.pushNamed(
                AppRoutes.videoUpload.name,
                extra: {"lectureId": lecture.id},
              );
            },
            child: Container(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: greyColor),
              ),
              child: Text("Edit"),
            ),
          ),
  );
}
