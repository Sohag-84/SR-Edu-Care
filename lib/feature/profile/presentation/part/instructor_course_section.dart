import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/core/utils/circular_indicator.dart';
import 'package:sr_edu_care/core/widgets/custom_course_card.dart';
import 'package:sr_edu_care/feature/course/presentation/bloc/instructor_course/instructor_course_bloc.dart';
import 'package:sr_edu_care/routes/app_routes.dart';

class InstructorCourseSection extends StatefulWidget {
  const InstructorCourseSection({super.key});

  @override
  State<InstructorCourseSection> createState() =>
      _InstructorCourseSectionState();
}

class _InstructorCourseSectionState extends State<InstructorCourseSection> {
  @override
  void initState() {
    super.initState();
    context.read<InstructorCourseBloc>().add(InstructorCourseFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Courses',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'See All',
                style: TextStyle(fontSize: 14.sp, color: Colors.blue),
              ),
            ),
          ],
        ),

        BlocBuilder<InstructorCourseBloc, InstructorCourseState>(
          builder: (context, state) {
            if (state is InstructorCourseLoading) {
              return SizedBox(height: 200.h, child: loader());
            } else if (state is InstructorCourseFailure) {
              return SizedBox(
                height: 200.h,
                child: Center(child: Text(state.error)),
              );
            } else if (state is InstructorCourseLoaded) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 8.w,
                  mainAxisExtent: 205.h,
                ),
                itemCount: state.courseList.length,
                itemBuilder: (BuildContext context, int index) {
                  final course = state.courseList[index];
                  return CustomCourseCard(
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.course.name,
                        extra: {"courseId": course.id},
                      );
                    },
                    thumbnailImage: course.courseThumbnail.toString().isEmpty
                        ? "https://cdn.ostad.app/course/photo/2025-12-08T14-25-01.527Z-Course-Thumbnail-12.jpg"
                        : course.courseThumbnail!,
                    title: course.courseTitle,
                    courseDuration: '3h 20m',
                    lessonCount: "(${course.sections.length}Lessons)",
                    level: course.courseLevel,
                    categroy: course.category,
                  );
                },
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
