import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/core/widgets/custom_course_card.dart';
import 'package:sr_edu_care/services/local_preference_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person_2),
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Hi ${LocalPreferenceService.instance.getUsername()}",
              style: TextStyle(fontSize: 13.sp),
            ),
            GestureDetector(
              onTap: () {
                LocalPreferenceService.instance.removeToken();
              },
              child: Text(
                "Find your lesson",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ],
        ),
        actions: [Icon(Icons.notifications_outlined)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Gap(10.h),
            Text(
              featureCourses,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            Gap(10.h),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                mainAxisExtent: 165.h,
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return CustomCourseCard(
                  onTap: () {},
                  thumbnailImage:
                      "https://cdn.ostad.app/course/photo/2025-12-08T14-25-01.527Z-Course-Thumbnail-12.jpg",
                  title: 'Full stack web development advanced course',
                  lessonCount: "(7 Lessons)",
                  courseDuration: "6h 55min",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
