import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_edu_care/core/cloudinary/video_upload.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/core/widgets/custom_course_card.dart';
import 'package:sr_edu_care/feature/home/presentation/bloc/course_bloc.dart';
import 'package:sr_edu_care/services/local_preference_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<CourseBloc>().add(FetchCourses(page: 1, limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VideoUploadPage();
              }));
            },
          child: Icon(Icons.person_2)),
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Hi ${LocalPreferenceService.instance.getUsername()}",
              style: TextStyle(fontSize: 13.sp),
            ),
            GestureDetector(
              onTap: () {
                // LocalPreferenceService.instance.removeToken();
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
        child: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CourseError) {
              return Center(child: Text(state.message));
            } else if (state is CourseLoaded) {
              return Column(
                crossAxisAlignment: .start,
                children: [
                  Gap(10.h),
                  Text(
                    featureCourses,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(10.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                      mainAxisExtent: 205.h,
                    ),
                    itemCount: state.courseWapper.courses.length,
                    itemBuilder: (BuildContext context, int index) {
                      final course = state.courseWapper.courses[index];
                      return CustomCourseCard(
                        onTap: () {},
                        thumbnailImage: course.courseThumbnail == ""
                            ? "https://cdn.ostad.app/course/photo/2025-12-08T14-25-01.527Z-Course-Thumbnail-12.jpg"
                            : course.courseThumbnail.toString(),
                        title: course.courseTitle,
                        lessonCount: "(${course.sections.length} Lessons)",
                        courseDuration: "6h 55min",
                        level: course.courseLevel,
                        categroy: course.category,
                      );
                    },
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
