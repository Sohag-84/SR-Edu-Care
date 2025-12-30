import 'package:any_image_view/any_image_view.dart';
import 'package:go_router/go_router.dart';
import 'package:sr_edu_care/core/constants/app_assets.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/core/widgets/custom_course_card.dart';
import 'package:sr_edu_care/routes/app_routes.dart';
import 'package:sr_edu_care/services/local_preference_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontSize: 18.sp)),
        leading: LocalPreferenceService.instance.getUserRole() == "admin"
            ? GestureDetector(
                onTap: () {
                  context.pushNamed(AppRoutes.videoUpload.name);
                },
                child: Icon(Icons.upload_file),
              )
            : null,
        actions: [
          IconButton(
            onPressed: () {
              LocalPreferenceService.instance.removeToken();
              context.goNamed(AppRoutes.login.name);
            },
            icon: Icon(Icons.logout),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            //profile image
            AnyImageView(
              imagePath: whiteLogo,
              borderRadius: BorderRadius.circular(100.r),
              height: 100.h,
              width: 100.w,
            ),
            Gap(5.h),
            //username
            Text(
              LocalPreferenceService.instance.getUsername(),
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            Gap(2.h),
            //email
            Text(
              LocalPreferenceService.instance.getEmail(),
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),

            Gap(20.h),
            //purchased courses section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Purchased Courses',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 14.sp, color: Colors.blue),
                ),
              ],
            ),
            Gap(12.h),
            // Purchased courses list
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                mainAxisExtent: 205.h,
              ),
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) {
                return CustomCourseCard(
                  onTap: () {},
                  thumbnailImage:
                      "https://cdn.ostad.app/course/photo/2025-12-08T14-25-01.527Z-Course-Thumbnail-12.jpg",
                  title: 'Course Title $index',
                  courseDuration: '3h 20m',
                  lessonCount: "12 Lessons",
                  level: 'Beginner',
                  categroy: 'Programming',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
